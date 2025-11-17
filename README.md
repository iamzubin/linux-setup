
# dots

This repository contains my personal dotfiles for Linux.

## Installation

To install these dotfiles, you need [GNU Stow](https://www.gnu.org/software/stow/).

1. Clone this repository to your home directory (or wherever you prefer):

   ```sh
   git clone https://github.com/iamzubin/dots.git ~/dots
   cd ~/dots
   ```

2. Run the following command to symlink all dotfiles into your home directory:

   ```sh
   stow */
   ```

This will create symlinks for each directory (e.g., `nvim`, `zsh`, etc.) into your home directory. Make sure to review the changes before running if you already have existing configuration files.
