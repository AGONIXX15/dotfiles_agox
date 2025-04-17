return {
  "pylsp",
  opts = {
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enabled = true },
          pylint = { enabled = true },
          autopep8 = { enabled = true },
          yapf = { enabled = true },
          black = { enabled = true },
          flake8 = { enabled = true },
          mccabe = { enabled = true },
          pycodestyle = { enabled = true },
          rope_autoimport = { enabled = true },
        },
        progress = { skip_token_initialization = true },
      }
    }
  }
}
