#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, you can obtain one at http://mozilla.org/MPL/2.0/.

_git_cleanup() {
    # Code completion
    __gitcomp_nl "$(__git_heads)"

    # Prevent bash from doing filename completion
    compopt +o default
}
