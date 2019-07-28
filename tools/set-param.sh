#!/bin/sh

#  CROWN System Node docker template
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

PARAM=$(echo "$1" | sed "s/=.*//")
VALUE=$(echo "$1" | sed "s/[^>]*=//")
# escape value for sed
VALUE_FOR_SED=$(echo "$VALUE" | sed -e 's/[\/&]/\\&/g')

case $PARAM in
    ip)
        TEMP=$(sed "s/externalip=.*/externalip=$VALUE_FOR_SED/g" "$BASEDIR/../data/crown.conf")
        printf "%s" "$TEMP" > "$BASEDIR/../data/crown.conf"
    ;;
    nodeprivkey)
        TEMP=$(sed "s/systemnodeprivkey=.*/systemnodeprivkey=$VALUE_FOR_SED/g" "$BASEDIR/../data/crown.conf")
        printf "%s" "$TEMP" > "$BASEDIR/../data/crown.conf"
    ;;
    NODE_VERSION) 
        if grep "NODE_VERSION=" "$BASEDIR/../container/limits.conf"; then
            TEMP=$(sed "s/NODE_VERSION=.*/NODE_VERSION=$VALUE_FOR_SED/g" "$BASEDIR/../container/limits.conf")
            printf "%s" "$TEMP" > "$BASEDIR/../container/limits.conf"
        else 
            printf "\nNODE_VERSION=%s" "$VALUE" >> "$BASEDIR/../container/limits.conf"
        fi
    ;;
    PROJECT)
        printf "PROJECT=%s" "$VALUE" >  "$BASEDIR/../project_id"
    ;;
esac