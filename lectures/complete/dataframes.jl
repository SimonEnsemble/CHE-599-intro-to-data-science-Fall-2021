### A Pluto.jl notebook ###
# v0.16.1

using Markdown
using InteractiveUtils

# ╔═╡ 1f916158-033c-11eb-3042-556418cdd61e
using DataFrames, CSV, Statistics, PlutoUI

# ╔═╡ 1b29c142-033b-11eb-1fcd-3167939de8d2
md"
## introduction to `DataFrames`
tabular data manipulation

* a `DataFrame` is a popular data structure (in many languages) for storing data in tabular form (rows = instances, columns = features)
* the Julia package `DataFrames.jl` has many functions that operate on `DataFrames` that allow us to quickly query and manipulate data
* it can handle missing values efficiently
* the Julia package `CSV.jl` allows us to quickly and flexibly read CSV (= comma-separated value) files into `DataFrame`s and to write `DataFrame`s into a CSV file.

* `DataFrames.jl` [documentation](http://juliadata.github.io/DataFrames.jl/stable/)
* `CSV.jl` [documentation](https://juliadata.github.io/CSV.jl/stable/)
"

# ╔═╡ 31e25766-033c-11eb-3991-d55735f7977f
md"#### construct a `DataFrame` from scratch

this data table will contain information about cities in the US.

* rows = instances = cities
* columns = features = attributes of cities
"

# ╔═╡ 45806120-033c-11eb-359e-bfb9796dfee8
city = ["Corvallis", "Portland", "Eugene"]

# ╔═╡ bb7f6bbe-033c-11eb-0180-b7dcc731d8ed
population = [57961, 647805, 168916]

# ╔═╡ 2071b5b6-038f-11eb-182d-f392b2198f2e
# df_cities = DataFrame(city=city, population=population)
df_cities = DataFrame(city=["Corvallis", "Portland", "Eugene"],
	                  population=[57961, 647805, 168916])

# ╔═╡ bc58ac1c-033c-11eb-2698-f5fc4c20b8ce
md"#### append rows to a `DataFrame`

Bend, OR has a population of 94520.

Berkeley, CA has a population of 122324.

_approach 1_: think of rows of a `DataFrame` as an `Array`.
"

# ╔═╡ d172a490-033c-11eb-157e-6b95587099dd
begin
	new_row = ["Bend", 94520]
	push!(df_cities, new_row)
end

# ╔═╡ 78b1f924-033d-11eb-2937-ff9634f5aa9a
md"
_approach 2_: think of rows of a `DataFrame` as a `Dict`ionary.
"

# ╔═╡ 4c407c9a-0353-11eb-0618-955711917f54
begin
	second_new_row = Dict(:population => 122324, :city => "Berkeley")
	push!(df_cities, second_new_row)
end

# ╔═╡ 5e293c82-033d-11eb-3984-7164bf9a351d
md"#### append columns to a `DataFrame`

annual rainfall [inches]:
* Corvallis: 51.0
* Portland: 43.0
* Eugene: 47.0
* Bend: 12.0
* Berkeley: 25.0
"

# ╔═╡ a5e9fc00-0353-11eb-1443-63b1c2edab7c
begin
	# (1) treat it like an array, except columns are called by Symbol's, not Int's
	df_cities[!, :rain] = [51.0, 43.0, 47.0, 12.0, 25.0]
	
	# (2) allows you to insert a column at specified location
	insertcols!(df_cities, 2, :state => ["OR", "OR", "OR", "OR", "CA"])
	df_cities
end

# ╔═╡ a67b30b0-0353-11eb-2d2f-871d7a5ffd36
md"
#### how many rows/columns are in the `DataFrame`?
"

# ╔═╡ 6249187e-035a-11eb-2f6a-d3318cf2a996
size(df_cities) # (# rows, # cols)

# ╔═╡ a3421e44-035e-11eb-3cf7-c70142f0591d
md"
#### renaming a column
"

# ╔═╡ a9d20a30-035e-11eb-14f4-ddf7cdaa34f6
rename!(df_cities, :rain => :rainfall)

# ╔═╡ 581bfc10-0362-11eb-1b29-cfd4320a5130
md"#### deleting a row"

# ╔═╡ 5d2707ac-0362-11eb-13e4-0d80fce58fea
begin
	# add a bogus row we'll want to remove
	push!(df_cities, ["bogus", "blah", 0, 100.0]) 
	
	# add duplicate row we'll want to remove
	push!(df_cities, ["Berkeley", "CA", 122324, 25.0]) 
end

# ╔═╡ b7fb0648-0390-11eb-2dc5-8b6935d2545c
delete!(df_cities, 6)

# ╔═╡ b8de77aa-0362-11eb-36d9-1d905442ca13
md"
#### deleting rows that are not unique
"

# ╔═╡ cbf6250c-0362-11eb-365b-d327617f197e
unique!(df_cities)

# ╔═╡ 63716d2a-0362-11eb-3ce5-3b41d4bef04c
md"
#### deleting a column
"

# ╔═╡ 6d39deee-0362-11eb-3dbb-0f34eff54591
begin
	# add a bogus column
	df_cities[:, :bogus_col] = [4, 3, 2, 3, 3]
	df_cities
end

# ╔═╡ 5931d59e-0391-11eb-078b-ddb0bcaf6521
select!(df_cities, Not(:bogus_col))

# ╔═╡ dc44eda2-ad55-4d3f-a0fc-3d6fec5cdc58
df_cities

# ╔═╡ 630b0e48-035a-11eb-15a4-a312e6941407
md"#### what are the column names in the `DataFrame`?
the column names are `Symbol`s.

!!! note
	if you have a fancy `String` you want to convert into a `Symbol`, `Symbol(\"avg salary (USD)\")` will convert the `String` `\"avg salary (USD)\"` into a `Symbol`.
"

# ╔═╡ d5b7f084-035a-11eb-32ef-6d645b8e0a6e
names(df_cities)

# ╔═╡ 9003f068-0391-11eb-2806-a76e99deefaa
Symbol("avg salary (USD)")

# ╔═╡ d663dd98-035a-11eb-156f-ff237a3944b6
md"
#### iterate through a `DataFrame`, row by row
"

# ╔═╡ 360eb67a-035b-11eb-2ab3-85adb264a387
with_terminal() do
	for row in eachrow(df_cities)
		# inside here, row is a ditionary. keys: column names.
		println(row[:city], " has a population of ", row[:population])
	end
end

# ╔═╡ 5d7208d4-035b-11eb-00ef-cd70b6cb79d3
md"
#### retreive a...

##### ... column

remember: the column names are `Symbol`s.

the columns are `Array`s.

_approach 1_: treat the `DataFrame` like a 2D array
"

# ╔═╡ 8d4f4ede-035b-11eb-2337-7bdb844389ae
df_cities[:, :population]

# ╔═╡ 65353008-035b-11eb-261f-fffc23ec79a7
md"
_approach 2_: treat the `DataFrame` like a `struct`
"

# ╔═╡ 9b569b7c-035b-11eb-2d27-cd4458bbbc02
df_cities.population

# ╔═╡ 7daa87e6-035b-11eb-3bb8-ff1bdd95714c
md"
##### ... row
"

# ╔═╡ f735e3ee-035b-11eb-33d1-755a1a9dc0a7
df_cities[2, :]

# ╔═╡ 1821e936-035c-11eb-0cb1-014241a2599e
md"
##### ... entry
"

# ╔═╡ 1ad35930-035c-11eb-165d-2d70f7b07713
df_cities[2, :population]

# ╔═╡ 22623c72-035c-11eb-20f1-233b92ef16f9
md"
##### ... combination of rows/columns"

# ╔═╡ 35c1b9a8-035c-11eb-05f6-67e7bd5ef6e3
df_cities[1:3, [:city, :state]]

# ╔═╡ 9e01dd3a-0362-11eb-3d19-392ec2d06bd6
md"
#### find unique entries of a column
"

# ╔═╡ a6f99cc8-0362-11eb-1801-2dd5fa96efe1
unique(df_cities[:, :state])

# ╔═╡ 366557f2-035c-11eb-31ce-9308dd49ce0c
md"#### querying a `DataFrame`

**example 1**: query all rows where the `:city` column is \"Corvallis\"

_approach 1_: much like `Array` slicing, using an `Array` of bits
"

# ╔═╡ 93ffa426-035c-11eb-0ae3-1b9d95676c9b
df_cities[df_cities[:, :city] .== "Corvallis", :]

# ╔═╡ 26ca5a26-035d-11eb-380f-5b62049bd5a1
md"_approach 2_: via the `filter` function.
* first argument: a function that operates on a row of the `DataFrame` (treating the row as a `Dict`) and returns `true` if we want to keep that row and `false` if we want to throw it away
* the second argument is the `DataFrame`
* there is also a `filter!` function that will remove these rows from the dataframe instead of returning a copy with the relevant rows removed
"

# ╔═╡ 5abb815e-0392-11eb-3576-a7e39e8ac6af
filter(row -> row[:city] == "Corvallis", df_cities)

# ╔═╡ 6ca4c6a8-035d-11eb-158c-3380a0cafdaa
md"**example 2**: query all cities (rows) where the population is less than 500,000"

# ╔═╡ 7dad5c94-035d-11eb-1f7b-2fedd834efaa
filter(row -> row[:population] < 500000, df_cities)

# ╔═╡ 7e54ed24-035d-11eb-19e2-4986b3cfcab4
md"**example 3**: query all cities in the state of Oregon"

# ╔═╡ 9879f190-035d-11eb-07c6-55453426c704
filter(row -> row[:state] == "OR", df_cities)

# ╔═╡ 9926bdbc-035d-11eb-1824-438e97d78ab9
md"#### sorting

e.g. permute rows so that cities are listed by `:population` in reverse (`rev`) order
"

# ╔═╡ ab918a54-035d-11eb-27ae-2d70b27460ac
sort!(df_cities, :population, rev=true)

# ╔═╡ 9ed15498-035d-11eb-1369-53ae1eac0a27
md"
#### grouping

the `groupby` command (common in many languages) partitions the rows in the `DataFrame` into multiple `DataFrame`s such that the rows in each share a common attribute (listed in a column). a `GroupedDataFrame` is very useful for performing computations on each group of rows in a `DataFrame` separately.

e.g., group the cities (rows) in `df_cities` by state.
"

# ╔═╡ c1526020-035d-11eb-2d8a-d131aa445738
gb_state = groupby(df_cities, :state)

# ╔═╡ e196029d-8f50-4f53-8298-f8e0472c3fc8
gb_state.groups

# ╔═╡ ed1a5928-be8b-4cd1-b9b8-2ed8c9e75996
# GroupedDataFrame's work like an array
gb_state[1]

# ╔═╡ e80a4a9a-0392-11eb-2d35-09bb527d7a29
with_terminal() do
	for df_by_state in gb_state
		# to which state does this group correspond?
		this_state = df_by_state[1, :state]
		
		# perform computation on this group
		#  here, we get the rainfalls in this group and take the mean
		avg_rainfall_in_this_state = mean(df_by_state[:, :rainfall])

		println("average rainfall in ", this_state, " is ", avg_rainfall_in_this_state)
	end
end

# ╔═╡ 4dd5195c-035e-11eb-1991-3fd9e7bf5d25
md"
#### split, apply, combine

split into groups, apply a function to a column of each data frame in the group, combine back into one data frame where each row pertains to a group.

##### `combine`
`combine(gdf, :col => f => :new_col)` takes in a `GroupedDataFrame` `gdf`, applies the function `f` to the `:col` column of each data frame in the group, then combines the results into a column `:new_col` in a new `DataFrame`, with each row representing a group. see [docs](https://dataframes.juliadata.org/stable/lib/functions/#DataFrames.combine).

_example 1_: group by state, take `mean` of the rainfall column.
"

# ╔═╡ 03a59b6c-035f-11eb-0a39-79c770bf5544
df_rain = combine(groupby(df_cities, :state), :rainfall => mean => :avg_rainfall)

# ╔═╡ 02fab01a-e9b8-4a43-aceb-31985194f4c6
md"
_example 2_: group by state, determine if `sum` of the rainfall is less than 50. "

# ╔═╡ a5ad8099-c40a-40c4-9197-a47281937537
combine(groupby(df_cities, :state), 
	:rainfall => (col -> sum(col) < 50.0) => :little_rainfall)

# ╔═╡ 27391eca-ce4b-434f-bba0-13fe0d700298
md"_example 3_: group by state, compute rainfall per person"

# ╔═╡ a6f0b99d-8b48-4758-89ee-9b2772965cab
combine(groupby(df_cities, :state),
	[:population, :rainfall] => 
	  ((pop_col, rain_col) -> sum(rain_col) / sum(pop_col)) => 
	  :rainfall_per_population
	)

# ╔═╡ 8226dc8e-0362-11eb-17bf-47cae0df2907
md"#### write a `DataFrame` to a `.csv` file

use the `CSV.jl` package.

CSV = comma separated value
"

# ╔═╡ 907832ea-0362-11eb-2132-a3abadd4b1ee
CSV.write("rainfall.csv", df_rain)

# ╔═╡ c711c3f8-0393-11eb-2fbc-77693069c73f
with_terminal() do
	run(`cat rainfall.csv`)
end

# ╔═╡ 08e91b1c-035f-11eb-05d0-9fe60938a4e3
md"#### read in a `.csv` file into a `DataFrame`
use the `CSV.jl` package.

CSV = comma separated value
"

# ╔═╡ fdab541a-0393-11eb-0318-3390bd75a95d
pwd() # present working directory to see where CSV looks for files

# ╔═╡ 1c01557a-035f-11eb-37e8-e9497003725f
df_incomes = CSV.read(joinpath("..", "..", "data", "incomes.csv"), DataFrame)

# ╔═╡ 4cf973b8-0361-11eb-1777-cf02396ba052
md"
#### joins
combine two data frames.
* that have one column in common, but  but one column in 

there are [seven types of joins](http://juliadata.github.io/DataFrames.jl/stable/man/joins/). let's illustrate two here.

goal: join information about *cities* from `df_cities` and `df_incomes`. thus the *key* here is `:city` since we aim to combine rows of the two `DataFrames` on the basis of the `:city` column.

subtlety here: 
* San Francisco is in `df_incomes` but missing from `df_cities`
* Bend, Eugene, Portland are in `df_cities` but missing from `df_incomes`

##### inner join
only keep rows where the city (the entry in the `on` column) is in _both_ `DataFrames`s
(throw out rows that aren't common between the two)
"

# ╔═╡ 74379f7c-0361-11eb-0192-c59bca513893
df_ij = innerjoin(df_cities, df_incomes, on=:city)

# ╔═╡ 80c12360-0361-11eb-3eb3-eddb35dac4a5
md"
##### outer join
keep all rows, fill entries with `missing` if an attribute is missing in either `DataFrame`.
"

# ╔═╡ 02bef8b2-0362-11eb-130f-f99cc7311f5a
df_oj = outerjoin(df_cities, df_incomes, on=:city)

# ╔═╡ 098a5628-0362-11eb-33af-9fc2fbceddba
md"#### missing values
Julia has a data type to efficiently handle missing values
"

# ╔═╡ 12deee64-0362-11eb-3612-ed369a623583
missing

# ╔═╡ 977c25ce-0394-11eb-0076-0955dcfe0ca1
typeof(missing)

# ╔═╡ 1e41218c-0362-11eb-2ae3-17339b033f7a
md"columns with missing values are arrays of whatever type but `Union`'d with the `Missing` type"

# ╔═╡ 25a8858c-0362-11eb-3405-95aeea8c1338
typeof(df_oj[:, :state])

# ╔═╡ 2fb25d0c-0362-11eb-16b3-b75f845f82a9
md"remove all rows that have a missing attribute"

# ╔═╡ 36ba914e-0362-11eb-0aa7-6fda9f1b4d02
dropmissing(df_oj)

# ╔═╡ 38ab5560-0362-11eb-15cb-4595de21d218
md"remove all rows with a missing state"

# ╔═╡ 3edf858c-0362-11eb-3b47-5f53c1360718
dropmissing(df_oj, :state)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CSV = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[compat]
CSV = "~0.9.4"
DataFrames = "~1.2.2"
PlutoUI = "~0.7.12"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[CSV]]
deps = ["CodecZlib", "Dates", "FilePathsBase", "Mmap", "Parsers", "PooledArrays", "SentinelArrays", "Tables", "Unicode", "WeakRefStrings"]
git-tree-sha1 = "3a877c2fc5c9b88ed7259fd0bdb7691aad6b50dc"
uuid = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
version = "0.9.4"

[[CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "31d0151f5716b655421d9d75b7fa74cc4e744df2"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.39.0"

[[Crayons]]
git-tree-sha1 = "3f71217b538d7aaee0b69ab47d9b7724ca8afa0d"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.0.4"

[[DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Reexport", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "d785f42445b63fc86caa08bb9a9351008be9b765"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.2.2"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "7d9d316f04214f7efdbb6398d545446e246eff02"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.10"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[FilePathsBase]]
deps = ["Dates", "Mmap", "Printf", "Test", "UUIDs"]
git-tree-sha1 = "6d4b609786127030d09e6b1ee0e2044ec20eb403"
uuid = "48062228-2e41-5def-b9a4-89aafe57970f"
version = "0.9.11"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[HypertextLiteral]]
git-tree-sha1 = "72053798e1be56026b81d4e2682dbe58922e5ec9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.0"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[InvertedIndices]]
git-tree-sha1 = "bee5f1ef5bf65df56bdd2e40447590b272a5471f"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.1.0"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "9d8c00ef7a8d110787ff6f170579846f776133a9"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.4"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlutoUI]]
deps = ["Base64", "Dates", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "f35ae11e070dbf123d5a6f54cbda45818d765ad2"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.12"

[[PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "a193d6ad9c45ada72c14b731a318bedd3c2f00cf"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.3.0"

[[PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "0d1245a357cc61c8cd61934c07447aa569ff22e6"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.1.0"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "54f37736d8934a12a200edea2f9206b03bdf3159"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.7"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "1162ce4a6c4b7e31e0e6b14486a6986951c73be9"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.5.2"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "216b95ea110b5972db65aa90f88d8d89dcb8851c"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.6"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[WeakRefStrings]]
deps = ["DataAPI", "Parsers"]
git-tree-sha1 = "4a4cfb1ae5f26202db4f0320ac9344b3372136b0"
uuid = "ea10d353-3f73-51f8-a26c-33c1cb351aa5"
version = "1.3.0"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─1b29c142-033b-11eb-1fcd-3167939de8d2
# ╠═1f916158-033c-11eb-3042-556418cdd61e
# ╟─31e25766-033c-11eb-3991-d55735f7977f
# ╠═45806120-033c-11eb-359e-bfb9796dfee8
# ╠═bb7f6bbe-033c-11eb-0180-b7dcc731d8ed
# ╠═2071b5b6-038f-11eb-182d-f392b2198f2e
# ╟─bc58ac1c-033c-11eb-2698-f5fc4c20b8ce
# ╠═d172a490-033c-11eb-157e-6b95587099dd
# ╟─78b1f924-033d-11eb-2937-ff9634f5aa9a
# ╠═4c407c9a-0353-11eb-0618-955711917f54
# ╟─5e293c82-033d-11eb-3984-7164bf9a351d
# ╠═a5e9fc00-0353-11eb-1443-63b1c2edab7c
# ╟─a67b30b0-0353-11eb-2d2f-871d7a5ffd36
# ╠═6249187e-035a-11eb-2f6a-d3318cf2a996
# ╟─a3421e44-035e-11eb-3cf7-c70142f0591d
# ╠═a9d20a30-035e-11eb-14f4-ddf7cdaa34f6
# ╟─581bfc10-0362-11eb-1b29-cfd4320a5130
# ╠═5d2707ac-0362-11eb-13e4-0d80fce58fea
# ╠═b7fb0648-0390-11eb-2dc5-8b6935d2545c
# ╟─b8de77aa-0362-11eb-36d9-1d905442ca13
# ╠═cbf6250c-0362-11eb-365b-d327617f197e
# ╟─63716d2a-0362-11eb-3ce5-3b41d4bef04c
# ╠═6d39deee-0362-11eb-3dbb-0f34eff54591
# ╠═5931d59e-0391-11eb-078b-ddb0bcaf6521
# ╠═dc44eda2-ad55-4d3f-a0fc-3d6fec5cdc58
# ╟─630b0e48-035a-11eb-15a4-a312e6941407
# ╠═d5b7f084-035a-11eb-32ef-6d645b8e0a6e
# ╠═9003f068-0391-11eb-2806-a76e99deefaa
# ╟─d663dd98-035a-11eb-156f-ff237a3944b6
# ╠═360eb67a-035b-11eb-2ab3-85adb264a387
# ╟─5d7208d4-035b-11eb-00ef-cd70b6cb79d3
# ╠═8d4f4ede-035b-11eb-2337-7bdb844389ae
# ╟─65353008-035b-11eb-261f-fffc23ec79a7
# ╠═9b569b7c-035b-11eb-2d27-cd4458bbbc02
# ╟─7daa87e6-035b-11eb-3bb8-ff1bdd95714c
# ╠═f735e3ee-035b-11eb-33d1-755a1a9dc0a7
# ╟─1821e936-035c-11eb-0cb1-014241a2599e
# ╠═1ad35930-035c-11eb-165d-2d70f7b07713
# ╟─22623c72-035c-11eb-20f1-233b92ef16f9
# ╠═35c1b9a8-035c-11eb-05f6-67e7bd5ef6e3
# ╟─9e01dd3a-0362-11eb-3d19-392ec2d06bd6
# ╠═a6f99cc8-0362-11eb-1801-2dd5fa96efe1
# ╟─366557f2-035c-11eb-31ce-9308dd49ce0c
# ╠═93ffa426-035c-11eb-0ae3-1b9d95676c9b
# ╟─26ca5a26-035d-11eb-380f-5b62049bd5a1
# ╠═5abb815e-0392-11eb-3576-a7e39e8ac6af
# ╟─6ca4c6a8-035d-11eb-158c-3380a0cafdaa
# ╠═7dad5c94-035d-11eb-1f7b-2fedd834efaa
# ╟─7e54ed24-035d-11eb-19e2-4986b3cfcab4
# ╠═9879f190-035d-11eb-07c6-55453426c704
# ╟─9926bdbc-035d-11eb-1824-438e97d78ab9
# ╠═ab918a54-035d-11eb-27ae-2d70b27460ac
# ╟─9ed15498-035d-11eb-1369-53ae1eac0a27
# ╠═c1526020-035d-11eb-2d8a-d131aa445738
# ╠═e196029d-8f50-4f53-8298-f8e0472c3fc8
# ╠═ed1a5928-be8b-4cd1-b9b8-2ed8c9e75996
# ╠═e80a4a9a-0392-11eb-2d35-09bb527d7a29
# ╟─4dd5195c-035e-11eb-1991-3fd9e7bf5d25
# ╠═03a59b6c-035f-11eb-0a39-79c770bf5544
# ╟─02fab01a-e9b8-4a43-aceb-31985194f4c6
# ╠═a5ad8099-c40a-40c4-9197-a47281937537
# ╟─27391eca-ce4b-434f-bba0-13fe0d700298
# ╠═a6f0b99d-8b48-4758-89ee-9b2772965cab
# ╟─8226dc8e-0362-11eb-17bf-47cae0df2907
# ╠═907832ea-0362-11eb-2132-a3abadd4b1ee
# ╠═c711c3f8-0393-11eb-2fbc-77693069c73f
# ╟─08e91b1c-035f-11eb-05d0-9fe60938a4e3
# ╠═fdab541a-0393-11eb-0318-3390bd75a95d
# ╠═1c01557a-035f-11eb-37e8-e9497003725f
# ╟─4cf973b8-0361-11eb-1777-cf02396ba052
# ╠═74379f7c-0361-11eb-0192-c59bca513893
# ╟─80c12360-0361-11eb-3eb3-eddb35dac4a5
# ╠═02bef8b2-0362-11eb-130f-f99cc7311f5a
# ╟─098a5628-0362-11eb-33af-9fc2fbceddba
# ╠═12deee64-0362-11eb-3612-ed369a623583
# ╠═977c25ce-0394-11eb-0076-0955dcfe0ca1
# ╟─1e41218c-0362-11eb-2ae3-17339b033f7a
# ╠═25a8858c-0362-11eb-3405-95aeea8c1338
# ╟─2fb25d0c-0362-11eb-16b3-b75f845f82a9
# ╠═36ba914e-0362-11eb-0aa7-6fda9f1b4d02
# ╟─38ab5560-0362-11eb-15cb-4595de21d218
# ╠═3edf858c-0362-11eb-3b47-5f53c1360718
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
