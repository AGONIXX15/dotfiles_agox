# Configuración de Neovim

Este repositorio contiene mi configuración personal de Neovim, diseñada para mejorar la productividad y la eficiencia en la edición de texto.

## Tabla de Contenidos

- [Instalación](#instalación)
- [Plugins](#plugins)
- [Configuraciones Personalizadas](#configuraciones-personalizadas)
- [Uso](#uso)
- [Contribuciones](#contribuciones)
- [Licencia](#licencia)

## Instalación

Para instalar mi configuración de Neovim, sigue estos pasos:

```bash
git clone https://github.com/AGONIXX15/dotfiles.git ~/.config/nvim
``` 
## Plugins

Este repositorio utiliza **Lazy.nvim** para gestionar los plugins de Neovim. A continuación se listan los plugins incluidos en mi configuración:

1. **nvim-treesitter**: Proporciona resaltado de sintaxis mejorado y características adicionales de análisis de código.
2. **telescope.nvim**: Un potente buscador que permite encontrar archivos, texto y más dentro del proyecto.
3. **gruvbox**: Un popular esquema de color que mejora la legibilidad.
4. **nvim-lspconfig**: Configuración de Language Server Protocol para un desarrollo más inteligente.
5. **nvim-cmp**: Autocompletado inteligente basado en el contexto.
6. **mason.nvim**: Gestiona herramientas LSP y formateadores.
7. **alpha-nvim**: Una pantalla de inicio personalizable para Neovim.

Puedes agregar o quitar plugins fácilmente editando el archivo de configuración de Lazy.nvim.

## Configuraciones Personalizadas

Esta sección detalla las configuraciones personalizadas que he realizado para optimizar mi flujo de trabajo:

- **Ajustes de línea**: He configurado Neovim para mostrar líneas de guía de indentación para facilitar la lectura del código.
  
- **Configuración de LSP**: Integración con varios lenguajes para proporcionar autocompletado y sugerencias en tiempo real.

- **Ajustes de tema**: Configuración de colores y esquemas visuales para una mejor experiencia visual.

Ejemplo de configuración de LSP para Python:

```lua
require'lspconfig'.pyright.setup{}
```
