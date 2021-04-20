#=====================================================================
#入力をするごとにスロットの値がきまる（１セット３回入力）
# 値が揃った場合はポイントを獲得できる
# スロットを一回行う毎にコインを消費する
# コインがある場合は「スロットを行う」または「やめる」を選択できる
# コインがなくなった場合はスロットゲームを終了とする
#---------------------------------------------------------------------
 
 
def Slot_Game
  slot_reel1 = [0,0,0]
  slot_reel2 = [0,0,0]
  slot_reel3 = [0,0,0]
  hit_line = [0,0,0,0,0]
  i = 0
  puts "Enterを押してリールを止めてください"
  puts "-------------------------"
  gets
  slot_reel1[0],slot_reel1[1],slot_reel1[2] = Slot_Reel_Setting()
  puts "["+slot_reel1[0].to_s+"]"
  puts "["+slot_reel1[1].to_s+"]"
  puts "["+slot_reel1[2].to_s+"]"
  puts "-------------------------"
  
  puts "Enterを押してリールを止めてください"
  puts "-------------------------"
  gets
  slot_reel2[0],slot_reel2[1],slot_reel2[2] = Slot_Reel_Setting()
  puts "["+slot_reel1[0].to_s+"]  ["+slot_reel2[0].to_s+"]"
  puts "["+slot_reel1[1].to_s+"]  ["+slot_reel2[1].to_s+"]"
  puts "["+slot_reel1[2].to_s+"]  ["+slot_reel2[2].to_s+"]"
  puts "-------------------------"
  
  puts "Enterを押してリールを止めてください"
  puts "-------------------------"
  gets
  slot_reel3[0],slot_reel3[1],slot_reel3[2] = Slot_Reel_Setting()
  puts "["+slot_reel1[0].to_s+"]  ["+slot_reel2[0].to_s+"]  ["+slot_reel3[0].to_s+"]"
  puts "["+slot_reel1[1].to_s+"]  ["+slot_reel2[1].to_s+"]  ["+slot_reel3[1].to_s+"]"
  puts "["+slot_reel1[2].to_s+"]  ["+slot_reel2[2].to_s+"]  ["+slot_reel3[2].to_s+"]"
  puts "-------------------------"
  
  if slot_reel1[0] == slot_reel2[0] && slot_reel1[0] == slot_reel3[0] then
    hit_line[i] = slot_reel1[0]
    i += 1
  end
  if slot_reel1[1] == slot_reel2[1] && slot_reel1[1] == slot_reel3[1] then
    hit_line[i] = slot_reel1[1]
    i += 1
  end
  if slot_reel1[2] == slot_reel2[2] && slot_reel1[2] == slot_reel3[2] then
    hit_line[i] = slot_reel1[2]
    i += 1
  end
  if slot_reel1[0] == slot_reel2[1] && slot_reel1[0] == slot_reel3[2] then
    hit_line[i] = slot_reel1[0]
    i += 1
  end
  if slot_reel1[2] == slot_reel2[1] && slot_reel1[2] == slot_reel3[0] then
    hit_line[i] = slot_reel1[2]
  end
  if hit_line[0] != 0 then
    puts "----大当たり！！！----"
    Coin_Status(1,hit_line)
  end
  return
end

def Slot_Reel_Setting
  loop{
    slot_reel = [rand(10),rand(10),rand(10)]
    slot_reel = [rand(3),rand(3),rand(3)]
    if slot_reel[0] != slot_reel[1] && slot_reel[0] != slot_reel[2] && slot_reel[1] != slot_reel[2] then
      return slot_reel[0],slot_reel[1],slot_reel[2]
    end
  }
end

def Coin_Status(type,coin)
  case type
  when 0 then
    puts "現在のコイン["+@coin.to_s+"]"
    puts "-------------------------"
    if @coin_bet != 0 then
      puts "Betするコインの枚数を入力してください"
      puts "前回と同じ枚数["+@coin_bet.to_s+"]の場合は0を入力"
      puts "ゲームを止める場合は-1以下を入力"
    else
      puts "Betするコインの枚数を入力してください"
      puts "ゲームを止める場合は-1以下を入力"
    end
    coin_bet = gets.to_i
    if @coin_bet != 0 && coin_bet == 0 then
      coin_bet = @coin_bet
    elsif coin_bet <= 0 then
      puts "ゲームを終了します"
      exit
    elsif coin_bet >= @coin then
      coin_bet = @coin
    end
    puts "["+coin_bet.to_s+"] 枚のコインをBetします"
    @coin_bet = coin_bet
    @coin -= coin_bet
  when 1 then
    coin.each do |coin_obtain|
      @coin += coin_obtain * @coin_bet
    end
  end
  return
end

@coin = 100
@coin_bet = 0

loop{
  Coin_Status(0,0)
  Slot_Game()
  if @coin <= 0 then
    puts "ゲームを終了します"
    exit
  end
}