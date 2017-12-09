#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-04
# Description: Fix locale messsage on Ubuntu.

# Fix locale problems on Ubuntu

fixlocale() {

	dpkg-reconfigure locales
	
}