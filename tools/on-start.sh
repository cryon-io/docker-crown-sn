#!/bin/sh

#  CROWN Masternode docker template
#  Copyright © 2019 cryon.io
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Affero General Public License as published
#  by the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Affero General Public License for more details.
#
#  You should have received a copy of the GNU Affero General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#  Contact: cryi@tutanota.com

BASEDIR=$(dirname "$0")

if [ -f "$BASEDIR/../data/bootstrap.dat.old" ]; then 
    rm -f "$BASEDIR/../data/bootstrap.dat.old"
elif [ -f "$BASEDIR/../data/bootstrap.dat" ]; then 
    sleep 1m
    i=0
    while [ ! -f "$BASEDIR/../data/bootstrap.dat" ]; do
        sleep 1m
        i=$(( $i + 1 ))
        [ $i -gt 60 ] && break;
    done
    if [ -f "$BASEDIR/../data/bootstrap.dat.old" ]; then 
        rm -f "$BASEDIR/../data/bootstrap.dat.old"
    fi
fi
exit 0