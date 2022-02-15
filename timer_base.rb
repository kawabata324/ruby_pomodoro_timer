# frozen_string_literal: true

require 'bundler'

Bundler.require
# タイマークラス
class TimerBase
  def initialize(minutes:)
    # Time.nowで現在時刻を呼び出せる,UTC???
    # 現在時刻 + 1 すると１秒増加する。今回は引数として分を受け取るので*60する必要がある
    @end_time = Time.now + (minutes * 60)
  end

  def run
    # 現在時刻よりを超えない限り処理を繰り返す
    while Time.now < @end_time
      # sleepに渡した引数の値だけ処理を停止する
      sleep 1
      # Time.to_i で起算時間からの秒数を整数で表すようにし、差分を変数に入れる
      diff_total_seconds = @end_time.to_i - Time.now.to_i
      # 時間を秒数に直すには60で割る必要がある　180 / 6 = 3 割り切れないパターンありそうだが...割り算の商が入るよう integer同士だから??
      remaining_minutes = diff_total_seconds / 60
      # formatメソッドを用いて表示される秒数をformatする。
      # 第一引数にとっているものは2桁の数に対して空白ではなく０で１０進数が表示されるようにしたものである。
      # 例　01 07.....
      # 第二引数にはformatしてほしい数をとるのだが、diff_total_secondsには全ての時間を秒数で表した値が入っている上記で分数で表せるものは分で表したいので
      # 分で表されたものは除外する必要がある分で表されたものを秒数に戻す
      remaining_seconds = format('%02d', diff_total_seconds - (remaining_minutes * 60))
      print "\r#{remaining_minutes}:#{remaining_seconds}"
      Timecop.travel(@end_time) unless ENV['DEBUG'].nil?
    end
  end
end
