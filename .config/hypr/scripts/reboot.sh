mkdir -p ~/.config/hypr/scripts

cat > ~/.config/hypr/scripts/poweroff.sh <<'EOF'
#!/bin/sh
# runs shutdown from lockscreen
systemctl poweroff
EOF

cat > ~/.config/hypr/scripts/reboot.sh <<'EOF'
#!/bin/sh
systemctl reboot
EOF

cat > ~/.config/hypr/scripts/suspend.sh <<'EOF'
#!/bin/sh
systemctl suspend
EOF

chmod +x ~/.config/hypr/scripts/*.sh
