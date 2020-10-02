#!/usr/bin/bash

bundle exec sass --update --sourcemap=none .; cp gtk-contained-dark.css ../../.config/gtk-3.0/gtk.css
