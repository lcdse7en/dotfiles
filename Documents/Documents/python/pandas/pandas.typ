=== "stdin" ===
//********************************************
// Author      : se7enlcd                    *
// E-mail      : 2353442022@qq.com           *
// Create_Time : 2023-10-08 20:12            *
// Description :                             *
//********************************************
#import "template.typ": *
#import "@preview/rubby:0.9.2": get-ruby
#import "@preview/codelst:1.0.0": sourcecode
#import "@preview/tablex:0.0.5": tablex, cellx, rowspanx, colspanx, hlinex, vlinex
#import "@preview/chic-hdr:0.3.0": *
#import "@preview/rose-pine:0.1.0": rose-pine
#import "@preview/codetastic:0.2.2": ean13, qrcode
// #import "@preview/fontawesome:0.1.0": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "pandas",
  authors: ((name: "Author: lcdse7en", email: "Email: 2353442022@qq.com"),),
  // Insert your abstract after the colon, wrapped in brackets.
  // Example: `abstract: [This is my abstract...]`
  abstract: [
    Pandas是Python的核心数据分析支持库，提供了快速、灵活、明确的数据结构，旨在简单、直观地处理关系型、标记型数据。Pandas的目标是成为 Python
    数据分析实践与实战的必备高级工具，其长远目标是成为最强大、最灵活、可以支持任何语言的开源数据分析工具。经过多年不懈的努力，Pandas离这个目标已经越来越近了。

    Pandas的主要数据结构是Series（一维数据）与DataFrame（二维数据），这两种数据结构足以处理金融、统计、社会科学、工程等领域里的大多数典型用例。对于R用户，DataFrame提供了比R语言data.frame更丰富的功能。Pandas基于NumPy开发，可以与其它第三方科学计算支持库完美集成。

    Pandas 就像一把万能瑞士军刀，下面仅列出了它的部分优势 ：
    - 处理浮点与非浮点数据里的缺失数据，表示为 NaN；
    - 大小可变：插入或删除 DataFrame 等多维对象的列；
    - 自动、显式数据对齐：显式地将对象与一组标签对齐，也可以忽略标签，在 Series、DataFrame 计算时自动与数据对齐；
    - 强大、灵活的分组（group by）功能：拆分-应用-组合数据集，聚合、转换数据；
    - 把 Python 和 NumPy 数据结构里不规则、不同索引的数据轻松地转换为 DataFrame 对象；
    - 基于智能标签，对大型数据集进行切片、花式索引、子集分解等操作；
    - 直观地合并（merge）、连接（join）数据集；
    - 灵活地重塑（reshape）、透视（pivot）数据集；
    - 轴支持结构化标签：一个刻度支持多个标签；
    - 成熟的 IO 工具：读取文本文件（CSV 等支持分隔符的文件）、Excel 文件、数据库等来源的数据，利用超快的 HDF5 格式保存 / 加载数据；
    - 时间序列：支持日期范围生成、频率转换、移动窗口统计、移动窗口线性回归、日期位移等时间序列功能。

    #qrcode("https://github.com/lcdse7en")
    #link(
      "https://github.com/lcdse7en/pandas",
    )[https://github.com/lcdse7en/pandas]
  ],
  date: "October 11, 2023",
)
#show heading.where(level: 1): it => block(width: 100%)[
  #set align(center)
  #set text(14pt, weight: "regular")
  #smallcaps(it.body)
]
#show heading.where(level: 2): it => block(width: 100%)[
  #set align(center)
  #set text(14pt, weight: "bold", fill: eastern)
  #smallcaps(it.body)
]
#show heading.where(level: 3): it => text(
  size: 12pt,
  weight: "bold",
  style: "italic",
  fill: orange,
  it.body + [.],
)
#show heading.where(level: 4): it => text(size: 11pt, weight: "bold", style: "normal", fill: black, it.body)

#show emph: e => {
  set text(font: "Cascadia Code")
  e
}
#let ruby = get-ruby(
  size: 0.5em,
  dy: 0pt,
  pos: top,
  alignment: "center",
  delimiter: "|",
  auto-spacing: true,
)
#show: chic.with(chic-footer(left-side: strong(link(
  "https://github.com/lcdse7en/pandas",
  "https://github.com/lcdse7en/pandas",
)), right-side: chic-page-number()), chic-header(
  // left-side: emph(chic-heading-name()),
  left-side: chic-page-number(),
  right-side: smallcaps("Pandas"),
), chic-separator(1pt), chic-offset(7pt), chic-height(1.5cm))

== Basic Operations

=== Series

==== Series Method and Properties

#pad(
  x: 16pt,
  tablex(
    columns: (auto, 1fr),
    inset: 5pt,
    map-hlines: h => (..h, stroke: black + 1pt),
    map-vlines: v => (..v, stroke: blue + 2pt),
    align: center + horizon,
    // auto-hlines: false,
    auto-vlines: false,
    repeat-header: true,
    header-rows: 1,
    /* --- header --- */
    cellx(fill: teal)[*DataFrame Method*],
    vlinex(),
    cellx(fill: teal, colspan: 1)[*Issue*],
    /* -------------- */
    [_Series.head()_],
    cellx(align: left, fill: white)[Series.head(int)],
    cellx(fill: gray)[_Series.tail()_],
    cellx(align: left, fill: gray)[Series.tail(int)],
    [_Series.unique()_],
    cellx(align: left, fill: white)[Series.unique() --> 去重，返回array],
    cellx(fill: gray)[_Series.isnull()_],
    cellx(align: left, fill: gray)[Series.isnull()],
    [_Series.notnull()_],
    cellx(align: left, fill: white)[Series.notnull()],
    cellx(fill: gray)[_Series.dtype_],
    cellx(align: left, fill: gray)[Series.dtype --> 数据类型],
    [_Series.tolist()_],
    cellx(align: left, fill: white)[Series.tolist()],
    cellx(fill: gray)[_Series.value_counts()_],
    cellx(align: left, fill: gray)[Series.value_counts()],
    [_Series.nlargest()_],
    cellx(align: left, fill: white)[Series.nlargest(int)],
    cellx(fill: gray)[_Series.nsmallest()_],
    cellx(align: left, fill: gray)[Series.nsmallest(int)],
    rowspanx(3)[_Series.str()_],
    cellx(align: left)[Series.str.replace("old", "new")],
    (),
    cellx(align: left)[...],
    (),
    cellx(align: left)[...],
    // cellx(fill: gray)[df.set_index()], cellx(align: left, fill: gray)[df.set_index(keys="date")], cellx(align: center, fill: gray)[设置行索引],
  ),
)

==== Series.map(dic) -- 映射
#sourcecode[```python
                                              # map --> 映射
                                              dic = {
                                                  "py": "python",
                                                  "js": "javascript",
                                              }
                                              df1 = df["lang"].map(dic)

                                              # map --> 运算
                                              def after_sal(s):
                                                  return s - (s-3000)*0.5
                                              df["after_sal"] = df["salary"].map(after_sal)
                                              ```]

#pad(
  x: 16pt,
  tablex(
    columns: (auto, 1fr, auto),
    inset: 5pt,
    map-hlines: h => (..h, stroke: black + 1pt),
    map-vlines: v => (..v, stroke: blue + 2pt),
    align: center + horizon,
    // auto-hlines: false,
    auto-vlines: false,
    repeat-header: true,
    header-rows: 1,
    /* --- header --- */
    cellx(fill: teal)[*DataFrame Method*],
    vlinex(),
    cellx(fill: teal, colspan: 1)[*Example*],
    vlinex(),
    cellx(fill: teal)[*Isuue*],
    /* -------------- */
    rowspanx(2)[_Series.map()_],
    cellx(align: left, fill: white)[Series.map(dict)],
    cellx(align: center, fill: white, rowspan: 1)[映射],
    (),
    cellx(align: left)[Series.map(func)],
    [运算],
    // cellx(fill: gray)[df.set_index()], cellx(align: left, fill: gray)[df.set_index(keys="date")], cellx(align: center, fill: gray)[设置行索引],
  ),
)

=== DataFrame

==== DataFrame() -- Structure DataFrame(构造 DataFrame)
- #text(fill: purple)[data]: dict or Two-dimensional array
- #text(fill: purple)[columns]: list of string ,设置列的显式索引
- #text(fill: purple)[index]: list of string ,设置行的显式索引
#sourcecode[```python
                                              import numpy as np
                                              from pandas import DataFrame

                                              df = DataFrame(data=np.random.randint(low=0, high=100, size(8,4)))
                                              df1 = df[["column1 Name", "column2 Name"]] --> 取多列
                                              df1 = df.iloc[[0, 3, 5]] --> 取多行
                                              df1 = df[0:2] --> 取1-2行
                                              df1 = df.iloc[:, 0:2] --> 取1-2列 iloc: [
                                              ```]

#pad(
  x: 12pt,
  tablex(
    columns: (1fr, auto, auto),
    inset: 5pt,
    map-hlines: h => (..h, stroke: black + 1pt),
    map-vlines: v => (..v, stroke: blue + 2pt),
    align: center + horizon,
    // auto-hlines: false,
    auto-vlines: false,
    repeat-header: true,
    header-rows: 1,
    /* --- header --- */
    cellx(fill: teal)[*DataFrame Method*],
    vlinex(),
    cellx(fill: teal, colspan: 1)[*Example*],
    vlinex(),
    cellx(fill: teal)[*Isuue*],
    /* -------------- */
    rowspanx(2)[_df.replace()_],
    cellx(align: left, fill: white)[df.replace(to_replace=2, value="Two")],
    cellx(align: center, fill: white, rowspan: 1)[全局替换],
    (),
    [df.replace(to_replace={4,2}, value="Two")],
    [将第四列的2替换为Two],
    // cellx(fill: gray)[df.set_index()], cellx(align: left, fill: gray)[df.set_index(keys="date")], cellx(align: center, fill: gray)[设置行索引],
  ),
)

=== Pandas read_file and DataFrame to_file

==== pd.read_csv()
- #text(fill: purple)[filepath_or_buffer]: string
- #text(fill: purple)[sep]: character, default ","
- #text(fill: purple)[usecols]: list of string, use name of columns
- #text(fill: purple)[encoding]: string, "utf-8", "GBK"
- #text(fill: purple)[index_col]: int, sequence or boolean, optional. default
  None, use index_col=False
- #text(fill: purple)[header]: int or None, default 0
- #text(fill: purple)[names]: list of string, add custom columns name, use:
  header=None
==== df.to_excel()
#sourcecode[```python
                                              df.to_excel(
                                                  excel_writer = "test.xlsx",
                                                  sheet_name = "test",
                                                  index = False,
                                                  freeze_panes = (1,1)
                                              )
                                              ```]

=== Get DataFrame the number of rows and columns
#sourcecode[```python
                                              # get rows
                                              len(df)
                                              df.shape[0]
                                              # get columns
                                              df.shape[1]
                                              len(df.columns)
                                              ```]

=== DataFrame insert column

==== df.insert()
- #text(fill: purple)[loc]: int
- #text(fill: purple)[column]: string
- #text(fill: purple)[value]: int, Series or array-like
- #text(fill: purple)[allow_duplicates]: bool, default False
#sourcecode[```python
                                              # method one
                                              df.insert(
                                                  loc=0,
                                                  column="ID",
                                                  value=range(1, len(df) + 1)
                                              )
                                              # method two
                                              df["ID"] = range(1, len(df) + 1)

                                              ```]

=== DataFrame sort

==== df.sort_values()
- #text(fill: purple)[by]: string or list of string
- #text(fill: purple)[ascending]: boolean or list of boolean, False: descending,
  True: ascending
- #text(fill: purple)[inplace]: boolean

#pagebreak()
== Advanced Operations

=== Data Cleaning (数据清洗)

==== df.fillna() -- (空值[NaN]处理：填充空值)

- #text(fill: purple)[method]: string, "ffill" (向前填充), "bfill" (向后填充)
- #text(fill: purple)[axis]: int, 1(row), 0(column)
- #text(fill: purple)[value]: int, string
#sourcecode[```python
                                              import numpy as np
                                              from pandas import DataFrame

                                              df = DataFrame(data=np.random.randint(low=0, high=100, size(3,5)))
                                              df.iloc[1,2] = None --> (np.nan) NaN

                                              # 查看存在空值的行
                                              print(df.loc[df.isnull().any(axis=1)])
                                              # 查看不存在空值的行
                                              print(df.loc[df.notnull().all(axis=1)])

                                              # 空值(NaN)填充
                                              df1 = df.fillna(method="ffill", axis=0)
                                              # 检测是否填充完整
                                              print(df1.isnull().any(axis=0)) --> boolean
                                              ```]

==== df.drop() -- (空值[NaN]处理：删除空值行)

- #text(fill: purple)[labels]: list of int64Index
- #text(fill: purple)[axis]: 0(row), 1(column)
#sourcecode[```python
                                              import numpy as np
                                              from pandas import DataFrame

                                              df = DataFrame(data=np.random.randint(low=0, high=100, size(3,5)))
                                              df.iloc[1,2] = None --> (np.nan) NaN

                                              # 查看存在空值的行
                                              print(df.loc[df.isnull().any(axis=1)])
                                              # 查看不存在空值的行
                                              print(df.loc[df.notnull().all(axis=1)])

                                              # 空值(NaN)删除
                                              drop_index = df.loc[df.isnull().any(axis=1)].index
                                              df1 = df.drop(labels=drop_index, axis=0, inplace=True) --> df.drop*: 0(row), 1(column)

                                              # 检测是否填存在空值
                                              print(df1.isnull().any(axis=0)) --> boolean
                                              ```]

==== df.dropna() -- (可以直接将存在缺失值[NaN]的行或者列删除)
- #text(fill: purple)[axis]: 0(row), 1(column)
#sourcecode[```python
                                              df1 = df.dropna(axis=0)
                                              ```]

==== df.drop_duplicate() -- Handle duplicate data (删除重复数据)
- #text(fill: purple)[keep]: "first", "last", False
#sourcecode[```python
                                              df1 = df.drop_duplicate(keep="first")
                                              ```]

=== pd.concat() -- Cascade (内-外级联)

==== pd.concat()
- #text(fill: purple)[objs]:
- #text(fill: purple)[axis]: 0(column), 1(row)
- #text(fill: purple)[join]: inner, outer, default inner
- #text(fill: purple)[ignore_index]: boolean, default False
#sourcecode[```python
                                              df = pd.concat(objs=(df1, df2), axis=1)  --> col + col
                                              # 不匹配级联
                                              df = pd.concat(objs=(df1, df2), axis=0, join="outer") --> row + row --> + NaN
                                              ```]

=== pd.merge() -- Merge (合并)

==== pd.merge()
- #text(fill: purple)[left]: DataFrame
- #text(fill: purple)[right]: DataFrame
- #text(fill: purple)[on]: string of column name, default None
- #text(fill: purple)[how]: "inner", "outer", "left", "right", default "inner"
- #text(fill: purple)[left_on]: string of column name
- #text(fill: purple)[right_on]: string of column name
#sourcecode[```python
                                              df = pd.merge(left=df1, right=df2, on="column Name", how="outer")
                                              ```]

=== pd.apply()

Apply a function along an axis of the DataFrame.

Objects passed to the function are Series objects whose index is either the
DataFrame's index (axis=0) or the DataFrame's columns (axis=1)

==== pd.apply()
#sourcecode[```python
                                              def get_type(x):
                                                  if x["bwendu"] > 33:
                                                      return "高温"
                                                  if x["ywendu"] < -10:
                                                      return "低温"
                                                  return "常温"

                                              df.loc[:,"wendu_type"] = df.apply(get_type, axis=1)
                                              ```]

=== Grouped aggregations (分组聚合)
