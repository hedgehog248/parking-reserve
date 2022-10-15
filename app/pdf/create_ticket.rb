class CreateTicket < Prawn::Document
  require 'prawn/measurement_extensions' # 長さの単位計算をできるようにする
  PAGE_WIDTH = 277.mm
  PAGE_HEIGHT = 190.mm

  def initialize(reservation, ticket)
    @reservation = reservation
    @ticket = ticket
    # 予約日時を変数に振り分ける
    st = separate_date(@reservation[:start_datetime])
    ed = separate_date(@reservation[:end_datetime])

    # 新規PDF作成
    super(page_size: 'A4',
      page_layout: :landscape,
      margin: 10.mm,
      compress: true
    )

    # 日本語フォントをデフォルトに設定
    font_families.update(
      'IPA Sans' => {
        normal: 'app/assets/fonts/ipaexg.ttf'
        }
      )
    font 'IPA Sans'
    font_size 14
    default_leading 12

    # 枠線の描画
    border_width = 8
    stroke_color '851253'
    dash([border_width, (border_width / 2)])
    self.line_width = border_width
    stroke do
      vertical_line 0, PAGE_HEIGHT, at: 0
      horizontal_line border_width, PAGE_WIDTH - border_width, at: PAGE_HEIGHT - (border_width / 2)
      vertical_line PAGE_HEIGHT, 0, at: PAGE_WIDTH
      horizontal_line PAGE_WIDTH - border_width, border_width, at: border_width / 2
    end

    # タイトル
    pad_top(30) {text "ABCマンション", size: 24, align: :center}
    text "来客用駐車場　使用許可証", size: 40, align: :center
    text "（区画 No.#{@reservation[:park_num]}）", size: 30, align: :center

    # 利用者記入欄
    move_down 20
    if ticket[:destination].present?     # distinationが入力されたかどうか
      destination = "#{ticket[:destination]}様方"
    else
      destination = "______号棟______号室___________________様方"
    end
    
    data = [["訪問先", "#{destination}"],
            ["停車日時", "#{st[0]}年 #{st[1]}月#{st[2]}日(#{st[3]}) #{st[4]}時#{st[5]}分〜"],
            ["", "#{ed[0]}年 #{ed[1]}月#{ed[2]}日(#{ed[3]}) #{ed[4]}時#{ed[5]}分"]]
    table(data, position: :center) do
      table_font = 22
      cells.borders = []
      cells.size = table_font
      columns(0).padding = [table_font / 2, table_font * 2, table_font / 10, 0] 
      columns(1).padding = [table_font / 2, 0, table_font / 10, 0]
    end

    # 注意書き
    move_down 50
    bounding_box([80, cursor], width: 600) do
      text "※駐車時間は24時間とします。
            ※必ず来客用駐車場をご使用ください。
            ※本表は外から見えるよう駐車車両に置いてください。
            ※お帰りの際は、本表を管理事務所へ必ずご返却ください。"
    end

    # 発行者名
    draw_text "ABCマンション管理組合", at: [200.mm, 20.mm], size: 16

    # Time Stamp
    draw_text "#{Time.now}", at: [200.mm, 10.mm], size: 10
  end

  def separate_date(date)
    wday = %w"日 月 火 水 木 金 土"[date.wday]
    ary = [date.year, date.month, date.day, wday, date.hour, date.min]
  end
end