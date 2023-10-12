# Pandas

## 1. Get DataFram the number of rows and columns

<kbd>get DataFrame rows and columns</kbd>

- rows: df.shape[0]
- columns: df.shape[1]

<kbd>get DataFrame rows</kbd>

- len(df)
- df.shape[0]

<kbd>get DataFrame columns</kbd>

- len(df.columns)
- df.shape[1]

## 1. Pandas read_file and DataFrame to_file

- read_csv
- read_excel
- read_json

### 1. pd.read_csv and df.to_csv

<kbd>pd.read_csv</kbd>

- filepath_or_buffer: 文件路劲，字符串形式
- sep: 制定分割符号，字符串形式
- usecols: 指定读取的列名，列表形式

  <kbd>df.to_csv</kbd>

  - path_or_buf: string or file handle, default None
  - sep: character, default ","
  - columns: sequence, optional
  - mode: "w"->重写，"a"->追加
  - index: 是否写入行索引，boolean
  - header: 是否写入列索引，boolean or list of string

### 2. pd.read_json and df.to_json

<kbd>pd.read_json</kbd>

- path_or_buf: string, default None
- orient: "records", default None
- typ: string, default "frame"
- lines: boolean, default False

## 2. DataFrame insert column

<kbd>DataFrame insert</kbd>

- loc: int
- allow_duplicates: bool, default False

```python
df.insert(loc=0, column="ID", value=range(1, len(df)+1))
df["ID"] = range(1, len(df)+1)
```

## 4. DataFrame sort

<kbd>df.sort_values</kbd>

- by: string or list of string
- ascending: boolean or list of boolean, False:降序, True: 升序
