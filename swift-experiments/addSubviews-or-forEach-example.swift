// For simplicity of an example, `self` is ignored in most cases

let views = [
    headerView,
    errorMessageView,
    userInputView,
    loginButton,
    forgotPasswordButton,
    signupView
]

// method 1
views.forEach { addSubview($0) }
// method 2
self.addSubviews(views)
