function fish_prompt
  echo -n (set_color blue)$USER(set_color normal)"@$hostname"(set_color blue)" $(prompt_pwd)> "
  set_color normal
end
