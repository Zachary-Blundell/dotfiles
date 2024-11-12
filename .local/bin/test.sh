#!/bin/bash

pkill -f evolution-addressbook-factory
pkill -f evolution-calendar-factory
pkill -f evolution-alarm-notify
pkill -f evolution-source-registry
pkill -f firedragon
pkill -f whatsapp-for-linux
pkill -f signal
pkill -f conky
pkill -f teams
pkill -f flameshot
pkill -f morgen
pkill -f garuda-system-maintenance

# Stop and disable background services
sudo systemctl stop ollama
sudo systemctl stop nordvpnd
