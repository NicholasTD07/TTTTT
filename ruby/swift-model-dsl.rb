module Swift
  def self.define(&block)
    proxy = DefinitionProxy.new
    proxy.instance_eval(&block)
  end

  @registry = {}

  def self.registry
    @registry
  end

  class DefinitionProxy
    def struct(struct_name, &block)
      struct_name = struct_name.capitalize

      puts "Defining a #{struct_name} struct with following attributes"

      struct = Struct.new
      if block_given?
        struct.instance_eval(&block)
      end

      puts "\t #{struct.attributes}"

      Swift.registry[struct_name] = struct
    end

    class Struct
      def initialize
        @attributes = {}
      end

      attr_reader :attributes

      def method_missing(name, *args, &block)
        attributes[name] = args[0]
      end
    end
  end
end

Swift.define do
  struct :user do
    name :string
    age :uint
  end

  struct :cat do
    id :uuid
    name :string
  end
end

Swift.registry   # => {:User=>#<Swift::DefinitionProxy::Struct:0x007fe1ad11ab20 @attributes={:name=>:string, :age=>:uint}>, :Cat=>#<Swift::DefinitionProxy::Struct:0x007fe1ad11a418 @attributes={:id=>:uuid, :name=>:string}>}

# TODO: Use a template engine
models = Swift.registry.map do |struct_name, definition|
  lets = definition.attributes.map do |name, type|
    "    public let #{name}: #{type}"
  end
  init = %Q(public init(...) {
    self.x = x
    self.y = y
})
%Q(public struct #{struct_name} {
#{lets.join "\n"}
})
end

puts models[0]           # => nil
puts models[1]           # => nil
# >> Defining a User struct with following attributes
# >> 	 {:name=>:string, :age=>:uint}
# >> Defining a Cat struct with following attributes
# >> 	 {:id=>:uuid, :name=>:string}
# >> public struct User {
# >>     public let name: string
# >>     public let age: uint
# >> }
# >> public struct Cat {
# >>     public let id: uuid
# >>     public let name: string
# >> }
