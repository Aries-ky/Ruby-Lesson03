#=====================================================================
#じゃんけんアプリ（あっち向いてホイつき）
# じゃんけんで自分が出す手を画面入力で選ぶことができる
# 相手プレーヤーが出す手をランダムで出力させる
# じゃんけんで勝った側があっち向いてホイです指を差す方向を決める
# じゃんけんで負けた側があっち向いてホイで顔を向ける方向を決める
# 勝負がついた場合はどちらが勝者かわかるように文字列などで出力する
#---------------------------------------------------------------------

def Janken_Game
  janken_name = ["グー！","チョキ！","パー！"]
  result = 0  
  result_name = ["勝ち！","負け！","引き分け！"]
  
  loop{
    puts "ジャンケン勝負 0:"+janken_name[0]+"1:"+janken_name[1]+"2:"+janken_name[2]+"3:やめる"
    num_select = gets.to_i
    if num_select < 0 || num_select > 2 then
      exit
    end
    cpu_select = rand(3)
    if num_select == 0 && cpu_select == 1 || num_select == 1 && cpu_select == 2 || num_select == 2 && cpu_select == 1 then
      result = 0
    elsif num_select == 0 && cpu_select == 2 || num_select == 1 && cpu_select == 0 || num_select == 2 && cpu_select == 1 then
      result = 1
    elsif num_select == cpu_select then
      result = 2
    end
    puts "--------------------------------------------"
    puts "あなたの手："+janken_name[num_select]
    puts ""
    puts "相手の手："+janken_name[cpu_select]
    puts ""
    puts "ホイ！"
    if result != 2 then
      puts "あなたの"+result_name[result]
    else
      puts result_name[result]
    end
    puts "--------------------------------------------"
    case result
    when 0 then
      return 0
    when 1 then
      return 1
    end
  }
  return
end

def Attimuite_Game(which)
  name = ["←","↑","→","↓"]
  result = 0  
  result_name = ["勝ち！","負け！"]
  puts "あっちむいて・・・！ 0:"+name[0]+"1:"+name[1]+"2:"+name[2]+"3:"+name[3]
  
  num_select = gets.to_i
  if num_select < 0 || num_select > 3 then
     exit
  end
  cpu_select = rand(4)
  if num_select != cpu_select then
    result = 1
  end
  puts "--------------------------------------------"
  puts "あなたの手："+name[num_select]
  puts ""
  puts "相手の手："+name[cpu_select]
  puts ""
  puts "ホイ！"
  puts "--------------------------------------------"
  if result == 0 then
    puts "あなたの"+result_name[which]
    puts ""
    puts ""
    puts ""
    puts "もう一度やる？"
    puts "0：はい　　１：いいえ"
    game_select = gets.to_i
    if game_select != 0 then
      exit
    end
  end
  return
end

loop{
  result = Janken_Game()
  Attimuite_Game(result)
}