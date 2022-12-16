### mutt

#### Dependencies Install
```sh
yay -S pam-gnupg
# sudo pacman -Qe pam-gnupg-git
sudo pacman -S mutt     # 客户端主程序
sudo pacman -S isync    # 拉取邮件工具
sudo pacman -S msmtp    # 发送邮件工具
sudo pacman -S pass     # 加密邮箱密码工具
```

E970401340040A3062A8577F20315C58DDB80403
#### Focus Dir
```sh
~/.mbsyncrc             # isync/mbsync配置文件
~/.config/mutt/         # mutt配置文件目录
~/.local/share/mail/    # isync拉取的邮件保存的目录
```

#### qq邮箱授权码
<!--TODO: mw -a 2353442022@qq.com || Enter password:-->
```sh
ytyuwaeqhmozeagd
```


#### Setting
```sh
mw
gpg --full-generate-key                      # 在系统中生成一对密钥对
# Real name: lcdse7en
# Email address: 2353442022@qq.com
# Comment: qq

pass init 2353442022@qq.com           # 加密存储邮箱密码

mw -a 2353442022@qq.com               # 添加邮箱账户 Enter password为邮箱授权码: ytyuwaeqhmozeagd
# 会生成
# ~/.mbsyncrc 
# ~/.config/msmtp/config 
# ~/.config/mutt/accounts/2353442022@qq.com.muttrc
# ~/config/muttrc


mv -Y # 手动同步邮件

sudo pacman -S cronie
sudo systemctl enable cronie
sudo systemctl start cronie
mw -t 10 # 每10分钟刷新一次邮件
crontab -l
```

#### sudo nvim /etc/pam.d/system-local-login
```sh
# https://github.com/cruegge/pam-gnupg
auth     optional  pam_gnupg.so store-only
session  optional  pam_gnupg.so
```

#### nvim ~/.gnupg/gpg-agent.conf
```sh
allow-preset-passphrase
max-cache-ttl 608400
```

#### gpg -K --with-keygrip
```sh
$ gpg -K --with-keygrip
# E970401340040A3062A8577F20315C58DDB80403
nvim ~/.pam-gnupg
```

#### abook
```sh
# ~/.config/mutt/accounts/2353442022@qq.com.muttrc
set display_filter="mutt_to_abook"
```

<++>


