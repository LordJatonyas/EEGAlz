### A Pluto.jl notebook ###
# v0.19.41

using Markdown
using InteractiveUtils

# ╔═╡ 70f3e92c-2339-42ea-9c73-9ab07730f569
# ╠═╡ show_logs = false
begin
    import CSV
	import DataFrames
	import Statistics
	import Plots
end

# ╔═╡ 5fee6ea7-34b9-4144-a998-0079b385856f
begin
	using CSV
	using DataFrames
	# Read file for participant 1 in data folder
	df = DataFrame(CSV.File("../data/sub01.csv"))
	df.first(2)
end

# ╔═╡ a255a0c1-31cf-446f-82ea-827326805b1b
begin
	largest_values = sort(df.Fp1, rev=true)[1:1000]
	smallest_values = sort(df.Fp1)[1:1000]
	largest_values
	using Plots
	pS = histogram(smallest_values, title="Smallest Values")
	pL = histogram(largest_values, title="Largest Values")
	plot(pS, pL, layout=(1,2), legend=false)
end

# ╔═╡ Cell order:
# ╠═70f3e92c-2339-42ea-9c73-9ab07730f569
# ╠═5fee6ea7-34b9-4144-a998-0079b385856f
# ╠═a255a0c1-31cf-446f-82ea-827326805b1b
