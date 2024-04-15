#let lec-report(doc, stu-id: "", stu-name: "", time: "", loc: "", speaker: "", subject: "") = {
  set page(margin: (top: 1in, bottom: 1in, left: 1.25in, right: 1.25in))

  align(center, block(text("人文讲座听课报告", font: "SimSun", size: 20pt, stroke: 0.5pt)))

  let cb(body, height: auto, ha: center) = align(ha, block(height: height, align(horizon, body)))

  set text(font: "FangSong", size: 16pt)

  let stu = [ #stu-id#stu-name ]

  let time_loc = [
    #set block(spacing: 0.5em)

    #time

    #loc
  ]

  let subject_w = {
    set par(leading: 0.5em)
    layout(size => {
      let (height,) = measure(block(width: size.width, subject))
      // Adjust font size based on height
      if height > 1.35cm {
        set text(size: 0.8em)
        set par(leading: 0.4em)
        subject
      } else {
        subject
      }
    })
  }

  let body_desc = [
    #set par(leading: 15.6pt * 2 - 1em)
    讲座摘要及听讲心得（参考字数:500字左右）
  ]

  let body = {
    set text(font: ("Times New Roman", "SimSun"), size: 10.5pt)
    set par(justify: true, first-line-indent: 2em, leading: 18pt - 1em)
    set block(spacing: 18pt - 1em)

    v(2pt)

    doc
  }

  let remark = [
    #set text(font: "Microsoft YaHei", size: 9pt, fill: rgb(192, 0, 0))
    #set par(justify: true)

    该报告请提交电子版。在吴健雄学院开设的“高端人文讲座系列”（讲座预告中会标注）中选听，每场完成 1 篇《听课报告》，通过网上系统完成报名、签到、提交报告，第3学年结束前进行审核。
  ]

  table(
    columns: (2.8cm, 1fr, 2.75cm, 1fr),
    inset: 1pt,
    table.header(repeat: false, cb(height: 1.14cm)[学号+姓名],
      cb(height: 1.14cm, stu),
      cb(height: 1.14cm)[时间地点],
      cb(height: 1.14cm, time_loc),
      cb(height: 1.28cm)[主讲人],
      cb(height: 1.28cm, speaker),
      cb(height: 1.28cm)[讲座题目],
      cb(height: 1.28cm,  subject_w),
    ),
    cb(height: 17.77cm, body_desc),
    table.cell(colspan: 3, body),
    table.footer(
      repeat: false,
      cb(height:2cm)[说明],
      table.cell(colspan: 3, cb(height: 2cm, ha: left, remark))
    ),
  )
}
