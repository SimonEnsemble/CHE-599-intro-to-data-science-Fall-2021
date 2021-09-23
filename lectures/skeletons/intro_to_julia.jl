### A Pluto.jl notebook ###
# v0.16.1

using Markdown
using InteractiveUtils

# ╔═╡ 23c448da-3628-4db1-b91f-b7fa2ac2d843
using PlutoUI ,Random, StatsBase

# ╔═╡ 1f74ddfe-fd19-11ea-1a0f-678021182d2c
md"
## introduction to the Julia programming language
![Julia logo](https://julialang.org/assets/infra/logo.svg)

_why Julia?_
* free, open-source
* high-level, thus easy to use
* dynamic, thus feels interactive
* expressive, read-like-a-book syntax
* high-performance (fast) (design choices allow just-in-time compiler to make optimizations, resulting in fast code)
* safety (offers optional type assertion)
* designed especially for scientific computing
* easy parallelization accross cores
* multiple dispatch (we'll see later)

> Julia: A language that walks like Python, runs like C

[link to official Julia website](https://julialang.org/) and 

[link to recent Nature article on Julia](https://www.nature.com/articles/d41586-019-02310-3)

_resources_:
* [official Julia documentation](https://docs.julialang.org/en/v1/)
* [Learn Julia in Y minutes](https://learnxinyminutes.com/docs/julia/)
* [Julia express](http://bogumilkaminski.pl/files/julia_express.pdf)
"

# ╔═╡ 2f9e20c0-fd1c-11ea-1064-411a3bbb014e
md"
# `Pluto` notebooks

(you're in one)

a `Pluto` notebook is a simple, dynamic, interactive Julia programming environment. in addition to code, it can contain documentation/writing to make a self-contained document, like in this cell!

YouTube video on `Pluto`: [here](https://www.youtube.com/watch?v=IAF8DjrQSSk).

the language used to format writing in `Pluto` is Markdown. see [here](https://docs.julialang.org/en/v1/stdlib/Markdown/) for the formatting possibilities.

move to the left and click the eye to make this cell unhidden and see the text to compose this cell.

e.g., code formatting inline `f(x)=cos(3.0 * π)` and in display:
```julia
function f(x)
	return cos(3.0 * π)
end
```
e.g. math formatting inline $f(x)=x^2\sin(x)$ and in display, via ``\LaTeX``
```math
f(x)=x^2 \sin(x)
```

go ahead, make your own markdown cell in `Pluto`!
"

# ╔═╡ f3fee3ca-fd1c-11ea-2906-9d8d6b874f66
md"
# learn Julia by example

### variable assignment

> an assignment statement sets and/or re-sets the value stored in the storage location(s) denoted by a variable name; in other words, it copies a value into the variable - [Wikipedia](https://en.wikipedia.org/wiki/Assignment_(computer_science))
"

# ╔═╡ b99409d6-fd1f-11ea-1cd5-e97615600cea


# ╔═╡ e267492c-fd1f-11ea-20a3-9f7759e16280
md"
\"we assign `x` to be 5.3\" $\neq$ \"x equals 5.3\"!

read [here](https://en.wikipedia.org/wiki/Assignment_(computer_science)#Assignment_versus_equality).
"

# ╔═╡ 0ae926cc-fd20-11ea-3e7f-1b8af64f05d8


# ╔═╡ 181fec1c-fd21-11ea-042c-23828f908e52
md"### basic types

**floating point representations of numbers**, i.e. `Float64`s

`x` is represented on your computer using a chuck of memory consisting of 64 bits (bit = binary digit). It is represented in the [double-precision floating point format](https://en.wikipedia.org/wiki/Double-precision_floating-point_format).

![Julia logo](https://upload.wikimedia.org/wikipedia/commons/a/a9/IEEE_754_Double_Floating_Point_Format.svg)

"

# ╔═╡ 11aa062e-fd21-11ea-068b-495c13f48386


# ╔═╡ 32d07345-7f33-4d6f-a601-862e9a2e5919
md"**integers**, i.e. `Int`s"

# ╔═╡ 2d622f08-fd22-11ea-2d6a-6bd48280b429


# ╔═╡ 315b0efe-fd22-11ea-1cdd-a5ded834ab2a


# ╔═╡ 2b0adfe9-028b-437c-99cc-39b993e036fa
md"**text**, i.e. `String`s"

# ╔═╡ 2ecab27a-fd22-11ea-09f6-03f120a4e4e2


# ╔═╡ d9b74a2e-fd22-11ea-39e1-7311dbdfdfa7


# ╔═╡ b8b5d778-b3e5-4c04-9e73-43a43017d75e
md"**booleans**, i.e. `Bool`s"

# ╔═╡ 73201488-bd70-473b-b12c-0cff76189138


# ╔═╡ bca6e98c-fd23-11ea-3435-7de54b441520


# ╔═╡ e87a9ca8-fd22-11ea-28f2-b55daeb0032e
md"
**symbols**, i.e. `Symbol`s
the `Symbol` is an [interned string](https://en.wikipedia.org/wiki/String_interning), which makes e.g. string comparison operations faster. 

_ambitious Beavs_: The function `pointer_from_objref` in Julia allows you to see where in memory an object in Julia is stored. Experiment with a `Symbol` and `String` to illustrate that `Symbol`s are *interned* strings. A more nuanced view of the `Symbol` is [here](https://stackoverflow.com/questions/23480722/what-is-a-symbol-in-julia#) by the co-creator and core developer of Julia.
"

# ╔═╡ 97e1060a-fd23-11ea-0724-b57130b840a0


# ╔═╡ ad38b10e-fd23-11ea-39c7-abec457dd0a9


# ╔═╡ c6038724-fd23-11ea-26f1-95f83c18b73a
md"### dictionaries

an unordered collection of (key, value) pairs. maps keys to values.
"

# ╔═╡ df7265ae-fd23-11ea-2062-590489759192


# ╔═╡ a5eef120-fd24-11ea-1fbc-9716cad65315


# ╔═╡ 06068334-fd25-11ea-380c-adf3a922c2ee


# ╔═╡ 0bcf7bea-fd25-11ea-02fd-734a32e86dfc


# ╔═╡ f8d312f4-1c16-4f97-abc3-767030b794c8
md"query a dictionary"

# ╔═╡ ef434eee-fd23-11ea-19e3-2578be44f9a0


# ╔═╡ 62d22a05-8971-43d5-99ba-c98eed82ed5f
md"add a new (key, value) pair"

# ╔═╡ fdc4e874-fd23-11ea-19e4-b3cfa1e8f9b4


# ╔═╡ d9bc41ea-fbd2-4102-8bbb-2cb0a3ba987d
md"iterate thru the (key, value) pairs of a dictionary"

# ╔═╡ 197e253a-fd24-11ea-3ba6-2bb768ca610a
with_terminal() do # this is to display the print statements in Pluto

end

# ╔═╡ 7b440f50-fd24-11ea-24e6-43ea33e3a9bb
md"### arrays

construct an array
"

# ╔═╡ 92493d42-fd24-11ea-277e-73ee6f34697f


# ╔═╡ a1574ae0-fd24-11ea-1d13-6bd7232b61dd


# ╔═╡ 6303f191-f5c8-4681-babe-368910562b6c
md"query, change an element"

# ╔═╡ 598be54f-01cc-4a17-94db-b0bb2d011d22


# ╔═╡ 9b569d44-fd24-11ea-3ae9-d9e86b734398


# ╔═╡ 0a366ce0-59e0-4c06-a00a-7d9f14bb4931
md"what is the length of the array?"

# ╔═╡ bdd6b318-fd24-11ea-03ca-05534b38845d


# ╔═╡ d363b716-fd25-11ea-11c9-8905dd4f3dc4
md"iterating thru an array (3 ways)

1. iterating through indices of the array 1,2,...,length(z)
"

# ╔═╡ b0312d60-fd24-11ea-2338-e33d7b7c7326
with_terminal() do

end

# ╔═╡ 61f2c93c-c003-4b4a-b96e-f4f0a718f814
md"2. directly iterating through the elements, if we don't need the indices"

# ╔═╡ 2bf8581d-d343-416d-921d-d0f92b257d5a
with_terminal() do

end

# ╔═╡ 69fb90f3-9a18-4bc4-912f-2b1cd45e04c7
md"3. iterating through both the indices and the elements"

# ╔═╡ 40f9dac7-9ab9-47e3-8655-b346b51f2aca
with_terminal() do

end

# ╔═╡ 88989cc8-fd26-11ea-2ad1-e54b6dfa0d75
md"adding elements to an array

... at the end
"

# ╔═╡ 8d7abd34-fd26-11ea-2ac8-59aa1152a963


# ╔═╡ 305e9461-7fda-4bc0-9140-c4fccfd3fc22
md"...at the beginning"

# ╔═╡ 9c9cf930-fd26-11ea-369d-05487ebb4a2c


# ╔═╡ adea9760-fd26-11ea-0507-db19248c356d
md"slicing an array

1. by indices"

# ╔═╡ b37ab55c-fd26-11ea-0d2f-43020e094843


# ╔═╡ 126a590e-fd28-11ea-1c02-c3262b85add7


# ╔═╡ 185775c2-fd28-11ea-03b1-a50001c813db


# ╔═╡ 74f433aa-4cd3-4fc6-b33c-15598b32aefc
md"2. by an array of `Bool`s"

# ╔═╡ 259be740-fd28-11ea-3cce-0959719ea489


# ╔═╡ 6081e190-fd28-11ea-37d5-81d995c5da53
md"slicing by `Bool`'s is especially useful for selecting certain elements of an array that obey a certain condition

e.g., let's get all array elements that are greater than 12."

# ╔═╡ 75e95b6a-fd28-11ea-3574-09b696391ec0


# ╔═╡ 8c4574e6-fd28-11ea-2d7b-41a82e763605


# ╔═╡ 382d122a-fd29-11ea-136e-3763d3b27fff
md"multi-dimensional arrays"

# ╔═╡ 3df06fcc-fd29-11ea-242e-459a5796c5e8


# ╔═╡ 47a89d1c-fd29-11ea-1249-716bfbaff87d


# ╔═╡ 56adbdc6-fd29-11ea-219a-07848f5ddbfd


# ╔═╡ 4d477196-fd29-11ea-1eeb-dd8885fafa93


# ╔═╡ 8cafc58a-fd2a-11ea-2d83-7fb53e343317
md"constructing an array, without typing out each entry manually

1. list comprehension (fast, beautiful)
"

# ╔═╡ 9a16deb6-fd2a-11ea-1810-8d0c1c22a39a


# ╔═╡ 5ae77a48-537d-4d9e-828d-8b3f362ed6a1
md"2. pre-allocate memory, fill in (fast, flexible, clear, but takes a few lines)"

# ╔═╡ 7a9e8be2-f906-4208-8816-7837e884ea2d


# ╔═╡ 5ebbbb2b-2c58-4219-9c79-dc33a8b000a3
md"3. start with empty array, add values (slow; only do when you don't know the size beforehand)"

# ╔═╡ 1c1caef9-3a3a-4ad5-a72c-3a69bb83f7f5


# ╔═╡ 4b34114b-df6e-4e76-9704-30c1e1986285
md"4. special constructors"

# ╔═╡ e3ecf6eb-52ba-4219-bc78-244801b33908


# ╔═╡ d94ab0cd-c061-4277-b116-04301de1b91d


# ╔═╡ b9cce99e-fd2a-11ea-03fe-3d20bfb629a7


# ╔═╡ 8349134c-fd2b-11ea-3426-7f3ad78a3384
md"element-wise operations on arrays"

# ╔═╡ 8d985c22-fd2b-11ea-38c8-25c40abddf44


# ╔═╡ a0a2a016-fd2b-11ea-1be7-595c50ab3751


# ╔═╡ a5c49b8a-fd2b-11ea-317a-814aa9d072ff


# ╔═╡ bb84580c-fd2b-11ea-34fe-03e69a043bc4
md"matrix multiplication"

# ╔═╡ c8fe380e-fd2b-11ea-3d76-edf4546e3d6b


# ╔═╡ cc7c41c4-fd2b-11ea-0fdc-9d18add5fea4


# ╔═╡ e3af0b56-fd2b-11ea-1a50-cd73d2d9fd48
md"### create your own data structure"

# ╔═╡ e9f164b4-fd2b-11ea-1b4b-4b95e685950a


# ╔═╡ 376ef642-fd2d-11ea-10e8-c35996c11e35
md"### functions
$x \mapsto f(x)$
"

# ╔═╡ b0432b82-4189-4df2-8072-896ce3ece6b8
md"1. inline construction (if a short function)"

# ╔═╡ 05f1d5ae-ad6b-4d9c-908c-da80373711d9


# ╔═╡ d1d463b4-8771-432a-af8b-0c5661fee1a3
md"2. expanded construction (if more code involved)"

# ╔═╡ 51d6689e-d3f2-49f2-ae65-66699eb2f4d8


# ╔═╡ 65ceb9db-57d8-4487-adf2-7f8511f68a66
md"evaluating a function"

# ╔═╡ 47fdafd4-8ff2-4735-b63f-f928d93d6569


# ╔═╡ 90f43dd5-22bc-4c06-b4d9-1f740924aa07


# ╔═╡ cd43a9d8-b891-44b2-803b-25f422b2e551
md"anonomous functions (not named but are passed to other functions)"

# ╔═╡ 9a496a9a-fd2d-11ea-036e-05a28c1882d9


# ╔═╡ 94901605-67b0-409b-bb20-a0955f5ae2ea
md"functions with multiple arguments"

# ╔═╡ d7cf8796-fd2d-11ea-2dae-13cf938bd877


# ╔═╡ ea3373ca-fd2d-11ea-25d4-0942d7faeb0b
md"*optional positional arguments*

> In many cases, function arguments have sensible default values and therefore might not need to be passed explicitly in every call. [source](https://docs.julialang.org/en/v1/manual/functions/#Optional-Arguments-1)

say `b` is almost always 0.0. let's not force the user to pass this arugment, yet let's also allow some flexibility if the user wants to change `b` from the default of `b=0.0`."

# ╔═╡ 066b7bfa-fd2e-11ea-34b5-5d23f5a433e4


# ╔═╡ 1781a568-fd2e-11ea-1280-43c4591acacd


# ╔═╡ 28534fae-fd2e-11ea-3f5a-836d16c725f8
md"*optional keyword arguments*

> Some functions need a large number of arguments, or have a large number of behaviors. Remembering how to call such functions can be difficult. Keyword arguments can make these complex interfaces easier to use and extend by allowing arguments to be identified by name instead of only by position. [source](https://docs.julialang.org/en/v1/manual/functions/#Keyword-Arguments-1)
"

# ╔═╡ 334d0616-fd2e-11ea-2d83-3d37fee60a74


# ╔═╡ 6a9fd648-fd2e-11ea-09f8-098fd33d82ff
md"*type declarations in functions*
> The :: operator can be used to attach type annotations to expressions and variables in programs. There are two primary reasons to do this:
> * As an assertion to help confirm that your program works the way you expect,
> * To provide extra type information to the compiler, which can then improve performance in some cases
> When appended to an expression computing a value, the :: operator is read as \"is an instance of\". It can be used anywhere to assert that the value of the expression on the left is an instance of the type on the right.
> [source](https://docs.julialang.org/en/v1/manual/types/index.html#Type-Declarations-1)"

# ╔═╡ 8c73923c-fd2e-11ea-2520-1736af901c1f


# ╔═╡ 0485bc6e-fd2f-11ea-36c9-05455f0b59e3


# ╔═╡ dd21f7a1-d76a-4a00-b036-db307ce67666
md"functions can take in our custom data types"

# ╔═╡ 0dacb54c-fd2f-11ea-05ff-4df8be2ef053


# ╔═╡ 8eb9d71d-7755-458a-92ab-b429d6b121d5


# ╔═╡ f621b84c-fd30-11ea-04e2-431ca045916f


# ╔═╡ 0e0a8cba-fd31-11ea-26ed-2d27f95f54ff
md"### control flow
> a control flow statement is a statement, the execution of which results in a choice being made as to which of two or more paths a computer program will follow - [Wikipedia](https://en.wikipedia.org/wiki/Control_flow)
"

# ╔═╡ 82eb1752-fd31-11ea-17be-11666cb6e2e8


# ╔═╡ 9ff8ba12-fd33-11ea-2eca-0fe897359d25


# ╔═╡ 933d5544-fd33-11ea-06af-8debefdb728a


# ╔═╡ 19cddf3a-fd35-11ea-328f-9397bc118698
md"### randomness, sampling
"

# ╔═╡ 85dc7b27-b5bc-41c1-941e-7053531270b8
md"generate a uniformly distributed number in $[0, 1]$"

# ╔═╡ 27ef6938-fd35-11ea-07e2-0b28886507bb


# ╔═╡ 47edae53-22a0-413e-9708-15089cd97aef
md"flip a coin"

# ╔═╡ 31f083f4-fd35-11ea-34d3-81f1d3e8dc6b


# ╔═╡ d65edc64-2b36-435e-ad92-22931078da45
md"generate a normally distributed number (μ = 0, σ = 1)"

# ╔═╡ 37b27476-fd35-11ea-1892-79927795db0f


# ╔═╡ 11537618-9916-485e-a6ca-a92756d87166
md"shuffle an array"

# ╔═╡ 4f4660e0-fd35-11ea-1186-252d22ca1c33


# ╔═╡ 55288cb8-fd35-11ea-3d35-e548167cb52e


# ╔═╡ d8dc6878-fa05-4508-a1c0-1a1f7dfa8021
md"sample elements from an array"

# ╔═╡ 62314e4a-fd35-11ea-271c-d90066d6cdd9


# ╔═╡ 7432ae22-fd35-11ea-35f2-170288e9c358


# ╔═╡ 8554b92a-fd35-11ea-2956-cdf98a96f9d1
md"### mutable vs immutable data structures

let's create an immutable `Tree` and a mutable `Car`, which each have an $x$ and $y$ coordinate on a plane.
"

# ╔═╡ 8e4a2f26-fd35-11ea-1009-4911e7010fe1


# ╔═╡ a8e165fe-fd40-11ea-2d25-192112ba9e43


# ╔═╡ e44e2d7a-fd40-11ea-25cf-c1ac05a92de5


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
Random = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"

[compat]
PlutoUI = "~0.7.10"
StatsBase = "~0.33.10"
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

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "1a90210acd935f222ea19657f143004d2c2a1117"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.38.0"

[[DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "7d9d316f04214f7efdbb6398d545446e246eff02"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.10"

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

[[HypertextLiteral]]
git-tree-sha1 = "72053798e1be56026b81d4e2682dbe58922e5ec9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

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
deps = ["Base64", "Dates", "HypertextLiteral", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "Suppressor"]
git-tree-sha1 = "26b4d16873562469a0a1e6ae41d90dec9e51286d"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.10"

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

[[StatsAPI]]
git-tree-sha1 = "1958272568dc176a1d881acb797beb909c785510"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.0.0"

[[StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "8cbbc098554648c84f79a463c9ff0fd277144b6c"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.10"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

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
# ╠═23c448da-3628-4db1-b91f-b7fa2ac2d843
# ╟─1f74ddfe-fd19-11ea-1a0f-678021182d2c
# ╟─2f9e20c0-fd1c-11ea-1064-411a3bbb014e
# ╟─f3fee3ca-fd1c-11ea-2906-9d8d6b874f66
# ╠═b99409d6-fd1f-11ea-1cd5-e97615600cea
# ╟─e267492c-fd1f-11ea-20a3-9f7759e16280
# ╠═0ae926cc-fd20-11ea-3e7f-1b8af64f05d8
# ╟─181fec1c-fd21-11ea-042c-23828f908e52
# ╠═11aa062e-fd21-11ea-068b-495c13f48386
# ╟─32d07345-7f33-4d6f-a601-862e9a2e5919
# ╠═2d622f08-fd22-11ea-2d6a-6bd48280b429
# ╠═315b0efe-fd22-11ea-1cdd-a5ded834ab2a
# ╟─2b0adfe9-028b-437c-99cc-39b993e036fa
# ╠═2ecab27a-fd22-11ea-09f6-03f120a4e4e2
# ╠═d9b74a2e-fd22-11ea-39e1-7311dbdfdfa7
# ╟─b8b5d778-b3e5-4c04-9e73-43a43017d75e
# ╠═73201488-bd70-473b-b12c-0cff76189138
# ╠═bca6e98c-fd23-11ea-3435-7de54b441520
# ╟─e87a9ca8-fd22-11ea-28f2-b55daeb0032e
# ╠═97e1060a-fd23-11ea-0724-b57130b840a0
# ╠═ad38b10e-fd23-11ea-39c7-abec457dd0a9
# ╟─c6038724-fd23-11ea-26f1-95f83c18b73a
# ╠═df7265ae-fd23-11ea-2062-590489759192
# ╠═a5eef120-fd24-11ea-1fbc-9716cad65315
# ╠═06068334-fd25-11ea-380c-adf3a922c2ee
# ╠═0bcf7bea-fd25-11ea-02fd-734a32e86dfc
# ╟─f8d312f4-1c16-4f97-abc3-767030b794c8
# ╠═ef434eee-fd23-11ea-19e3-2578be44f9a0
# ╟─62d22a05-8971-43d5-99ba-c98eed82ed5f
# ╠═fdc4e874-fd23-11ea-19e4-b3cfa1e8f9b4
# ╟─d9bc41ea-fbd2-4102-8bbb-2cb0a3ba987d
# ╠═197e253a-fd24-11ea-3ba6-2bb768ca610a
# ╟─7b440f50-fd24-11ea-24e6-43ea33e3a9bb
# ╠═92493d42-fd24-11ea-277e-73ee6f34697f
# ╠═a1574ae0-fd24-11ea-1d13-6bd7232b61dd
# ╟─6303f191-f5c8-4681-babe-368910562b6c
# ╠═598be54f-01cc-4a17-94db-b0bb2d011d22
# ╠═9b569d44-fd24-11ea-3ae9-d9e86b734398
# ╟─0a366ce0-59e0-4c06-a00a-7d9f14bb4931
# ╠═bdd6b318-fd24-11ea-03ca-05534b38845d
# ╟─d363b716-fd25-11ea-11c9-8905dd4f3dc4
# ╠═b0312d60-fd24-11ea-2338-e33d7b7c7326
# ╟─61f2c93c-c003-4b4a-b96e-f4f0a718f814
# ╠═2bf8581d-d343-416d-921d-d0f92b257d5a
# ╟─69fb90f3-9a18-4bc4-912f-2b1cd45e04c7
# ╠═40f9dac7-9ab9-47e3-8655-b346b51f2aca
# ╟─88989cc8-fd26-11ea-2ad1-e54b6dfa0d75
# ╠═8d7abd34-fd26-11ea-2ac8-59aa1152a963
# ╟─305e9461-7fda-4bc0-9140-c4fccfd3fc22
# ╠═9c9cf930-fd26-11ea-369d-05487ebb4a2c
# ╟─adea9760-fd26-11ea-0507-db19248c356d
# ╠═b37ab55c-fd26-11ea-0d2f-43020e094843
# ╠═126a590e-fd28-11ea-1c02-c3262b85add7
# ╠═185775c2-fd28-11ea-03b1-a50001c813db
# ╟─74f433aa-4cd3-4fc6-b33c-15598b32aefc
# ╠═259be740-fd28-11ea-3cce-0959719ea489
# ╟─6081e190-fd28-11ea-37d5-81d995c5da53
# ╠═75e95b6a-fd28-11ea-3574-09b696391ec0
# ╠═8c4574e6-fd28-11ea-2d7b-41a82e763605
# ╟─382d122a-fd29-11ea-136e-3763d3b27fff
# ╠═3df06fcc-fd29-11ea-242e-459a5796c5e8
# ╠═47a89d1c-fd29-11ea-1249-716bfbaff87d
# ╠═56adbdc6-fd29-11ea-219a-07848f5ddbfd
# ╠═4d477196-fd29-11ea-1eeb-dd8885fafa93
# ╟─8cafc58a-fd2a-11ea-2d83-7fb53e343317
# ╠═9a16deb6-fd2a-11ea-1810-8d0c1c22a39a
# ╟─5ae77a48-537d-4d9e-828d-8b3f362ed6a1
# ╠═7a9e8be2-f906-4208-8816-7837e884ea2d
# ╟─5ebbbb2b-2c58-4219-9c79-dc33a8b000a3
# ╠═1c1caef9-3a3a-4ad5-a72c-3a69bb83f7f5
# ╟─4b34114b-df6e-4e76-9704-30c1e1986285
# ╠═e3ecf6eb-52ba-4219-bc78-244801b33908
# ╠═d94ab0cd-c061-4277-b116-04301de1b91d
# ╠═b9cce99e-fd2a-11ea-03fe-3d20bfb629a7
# ╟─8349134c-fd2b-11ea-3426-7f3ad78a3384
# ╠═8d985c22-fd2b-11ea-38c8-25c40abddf44
# ╠═a0a2a016-fd2b-11ea-1be7-595c50ab3751
# ╠═a5c49b8a-fd2b-11ea-317a-814aa9d072ff
# ╟─bb84580c-fd2b-11ea-34fe-03e69a043bc4
# ╠═c8fe380e-fd2b-11ea-3d76-edf4546e3d6b
# ╠═cc7c41c4-fd2b-11ea-0fdc-9d18add5fea4
# ╟─e3af0b56-fd2b-11ea-1a50-cd73d2d9fd48
# ╠═e9f164b4-fd2b-11ea-1b4b-4b95e685950a
# ╟─376ef642-fd2d-11ea-10e8-c35996c11e35
# ╟─b0432b82-4189-4df2-8072-896ce3ece6b8
# ╠═05f1d5ae-ad6b-4d9c-908c-da80373711d9
# ╟─d1d463b4-8771-432a-af8b-0c5661fee1a3
# ╠═51d6689e-d3f2-49f2-ae65-66699eb2f4d8
# ╟─65ceb9db-57d8-4487-adf2-7f8511f68a66
# ╠═47fdafd4-8ff2-4735-b63f-f928d93d6569
# ╠═90f43dd5-22bc-4c06-b4d9-1f740924aa07
# ╟─cd43a9d8-b891-44b2-803b-25f422b2e551
# ╠═9a496a9a-fd2d-11ea-036e-05a28c1882d9
# ╟─94901605-67b0-409b-bb20-a0955f5ae2ea
# ╠═d7cf8796-fd2d-11ea-2dae-13cf938bd877
# ╟─ea3373ca-fd2d-11ea-25d4-0942d7faeb0b
# ╠═066b7bfa-fd2e-11ea-34b5-5d23f5a433e4
# ╠═1781a568-fd2e-11ea-1280-43c4591acacd
# ╟─28534fae-fd2e-11ea-3f5a-836d16c725f8
# ╠═334d0616-fd2e-11ea-2d83-3d37fee60a74
# ╟─6a9fd648-fd2e-11ea-09f8-098fd33d82ff
# ╠═8c73923c-fd2e-11ea-2520-1736af901c1f
# ╠═0485bc6e-fd2f-11ea-36c9-05455f0b59e3
# ╟─dd21f7a1-d76a-4a00-b036-db307ce67666
# ╠═0dacb54c-fd2f-11ea-05ff-4df8be2ef053
# ╠═8eb9d71d-7755-458a-92ab-b429d6b121d5
# ╠═f621b84c-fd30-11ea-04e2-431ca045916f
# ╟─0e0a8cba-fd31-11ea-26ed-2d27f95f54ff
# ╠═82eb1752-fd31-11ea-17be-11666cb6e2e8
# ╠═9ff8ba12-fd33-11ea-2eca-0fe897359d25
# ╠═933d5544-fd33-11ea-06af-8debefdb728a
# ╟─19cddf3a-fd35-11ea-328f-9397bc118698
# ╟─85dc7b27-b5bc-41c1-941e-7053531270b8
# ╠═27ef6938-fd35-11ea-07e2-0b28886507bb
# ╟─47edae53-22a0-413e-9708-15089cd97aef
# ╠═31f083f4-fd35-11ea-34d3-81f1d3e8dc6b
# ╟─d65edc64-2b36-435e-ad92-22931078da45
# ╠═37b27476-fd35-11ea-1892-79927795db0f
# ╟─11537618-9916-485e-a6ca-a92756d87166
# ╠═4f4660e0-fd35-11ea-1186-252d22ca1c33
# ╠═55288cb8-fd35-11ea-3d35-e548167cb52e
# ╟─d8dc6878-fa05-4508-a1c0-1a1f7dfa8021
# ╠═62314e4a-fd35-11ea-271c-d90066d6cdd9
# ╠═7432ae22-fd35-11ea-35f2-170288e9c358
# ╟─8554b92a-fd35-11ea-2956-cdf98a96f9d1
# ╠═8e4a2f26-fd35-11ea-1009-4911e7010fe1
# ╠═a8e165fe-fd40-11ea-2d25-192112ba9e43
# ╠═e44e2d7a-fd40-11ea-25cf-c1ac05a92de5
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
