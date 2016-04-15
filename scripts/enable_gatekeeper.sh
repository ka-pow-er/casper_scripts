#!/bin/sh
# Enables Gatekeeper to only allow Apps from the App Store and identified developers
sudo spctl --master-enable
sudo spctl --enable --label "Developer ID"
