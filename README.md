# NixCon invitation letter

This is a repository containing a LaTeX template for creating an invitation letter for NixCon.

## Setup

- LaTeX
  - Please use LuaLaTeX
- KOMAscript package and `scrlttr2` documentclass
- Conforms to DIN5008B
  - Note that, though it seems redundant at first, the sender address above the adressee is a back address (similar to the `reply-to` field in emails), which this norm dictates.   This is indeed practical, since not only the addressee but also a back address should be visible on an envelope with a window.
  
## Usage

### Data

- Change the variables in `data.sty` to change the data associated with whomever sends and receives the invitation
- Feel free to also change values or the text in `letter.tex`, the master file for this document.

### Compilation

- Change invitee data in in `data.sty`
- exec `nix run`
