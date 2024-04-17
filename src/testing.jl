### A Pluto.jl notebook ###
# v0.19.41

using Markdown
using InteractiveUtils

# ╔═╡ 70f3e92c-2339-42ea-9c73-9ab07730f569
# ╠═╡ show_logs = false
begin
    import Pkg
    # activate the shared project environment
    Pkg.activate(Base.current_project())
    # instantiate, i.e. make sure that all packages are downloaded
    Pkg.instantiate()
end

# ╔═╡ c8f52882-155d-439d-8bb1-d71166b24983
# ╠═╡ show_logs = false
Pkg.add("CSV")

# ╔═╡ 5fee6ea7-34b9-4144-a998-0079b385856f
begin
using CSV
using DataFrames
# Read file for participant 1 in data folder
df = DataFrame(CSV.File("../data/sub01.csv"))
first(df, 10)
end

# ╔═╡ a255a0c1-31cf-446f-82ea-827326805b1b
df.Fp2

# ╔═╡ Cell order:
# ╠═70f3e92c-2339-42ea-9c73-9ab07730f569
# ╠═c8f52882-155d-439d-8bb1-d71166b24983
# ╠═5fee6ea7-34b9-4144-a998-0079b385856f
# ╠═a255a0c1-31cf-446f-82ea-827326805b1b
