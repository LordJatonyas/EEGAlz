### A Pluto.jl notebook ###
# v0.19.41

using Markdown
using InteractiveUtils

# ╔═╡ 70f3e92c-2339-42ea-9c73-9ab07730f569
# ╠═╡ show_logs = false
begin
	using Pkg
	Pkg.activate(Base.current_project())
    # instantiate, i.e. make sure that all packages are downloaded
    Pkg.instantiate()
end

# ╔═╡ 3c22c13d-437b-42f1-8532-c9888cb3f0ff
using CSV, DataFrames, LinearAlgebra, Statistics, Plots

# ╔═╡ 5fee6ea7-34b9-4144-a998-0079b385856f
begin
	# Read file for participant 1 in data folder
	df = DataFrame(CSV.File("../data/sub01.csv"))
	first(df, 2)
end

# ╔═╡ a255a0c1-31cf-446f-82ea-827326805b1b
begin
	function hist_ends(channel, tail_length, channel_name)
		largest_values = sort(channel, rev=true)[1:tail_length]
		smallest_values = sort(channel)[1:tail_length]
		pS = histogram(smallest_values, title=channel_name * " - Smallest Values")
		pL = histogram(largest_values, title=channel_name * " - Largest Values")
		plot(pS, pL, layout=(1,2), legend=false)
	end
end

# ╔═╡ 3eae9452-1249-4880-a171-d644f367f9da
hist_ends(df.Fp1, 1000, "Fp1") # seems ok

# ╔═╡ 3fc02399-5f48-4e65-9a0c-d6937456a3dc
hist_ends(df.Fp2, 1000, "Fp2") # seems ok

# ╔═╡ 65bfb7ff-a7df-4e7c-9ab2-9239a6e689ac
hist_ends(df.F3, 1000, "F3")

# ╔═╡ b7d81afb-dfb3-42e1-96e9-f92fcf7f0cd1
begin
	# there don't seem to be anomalous data points! So normalise as per usual
	function normalise_channel(channel, positive_cutoff, negative_cutoff)
		largest_value = maximum(channel)
		smallest_value = minimum(channel)
		for i = 1:length(channel)
			if channel[i] > 0
				channel[i] = channel[i] / largest_value
			elseif channel[i] < 0
				channel[i] = - channel[i] / smallest_value
			end
		end
	end
end

# ╔═╡ 44f73ef0-afea-4d59-92be-bfba02482694


# ╔═╡ dd492d17-549a-4962-ad63-9bb40df946cb
println(maximum(df.Fp1), '\n', minimum(df.Fp1))

# ╔═╡ Cell order:
# ╠═70f3e92c-2339-42ea-9c73-9ab07730f569
# ╠═3c22c13d-437b-42f1-8532-c9888cb3f0ff
# ╠═5fee6ea7-34b9-4144-a998-0079b385856f
# ╠═a255a0c1-31cf-446f-82ea-827326805b1b
# ╠═3eae9452-1249-4880-a171-d644f367f9da
# ╠═3fc02399-5f48-4e65-9a0c-d6937456a3dc
# ╠═65bfb7ff-a7df-4e7c-9ab2-9239a6e689ac
# ╠═b7d81afb-dfb3-42e1-96e9-f92fcf7f0cd1
# ╠═44f73ef0-afea-4d59-92be-bfba02482694
# ╠═dd492d17-549a-4962-ad63-9bb40df946cb
