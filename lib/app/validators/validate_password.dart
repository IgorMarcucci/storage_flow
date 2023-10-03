String? passwordValidate(String password) {
  if (password.isEmpty == true) {
    return 'O campo é obrigatório';
  } else if (!RegExp(
          r"^(?=.*[A-Z])(?=.*[!#@$%&_*])(?=.*[0-9])(?=.*[a-z]).{8,32}$")
      .hasMatch(password)) {
    return 'A senha deve conter:\n - De 8 a 32 caracteres\n - Letra maiúscula e minúscula\n - Número\n - Caractere especial';
  }
  return null;
}
