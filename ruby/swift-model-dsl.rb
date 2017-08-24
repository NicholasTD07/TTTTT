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

puts

models = Swift.registry.map do |k, v|
  {k => v.attributes}
end

p models
# [{:User=>{:name=>:string, :age=>:uint}}, {:Cat=>{:id=>:uuid, :name=>:string}}]
