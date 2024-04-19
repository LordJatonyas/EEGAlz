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
using CSV, DataFrames, LinearAlgebra, Statistics, Plots, SeisNoise, DSP

# ╔═╡ 5fee6ea7-34b9-4144-a998-0079b385856f
begin
	# Read file for participant 1 in data folder
	df = DataFrame(CSV.File("../data/sub01.csv"))
	first(df, 2)
end

# ╔═╡ b7d81afb-dfb3-42e1-96e9-f92fcf7f0cd1
# ╠═╡ disabled = true
#=╠═╡
begin
	# we are assuming that the EEG recording is good
	function normalise_channel(channel)
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
  ╠═╡ =#

# ╔═╡ 1b347b1e-39da-4038-b6c6-461e6163007c
# ╠═╡ disabled = true
#=╠═╡
begin
	for i in names(df)
		detrend!(df[!, i])
		mute!(df[!, i])
		normalise_channel(df[!, i])
	end
end
  ╠═╡ =#

# ╔═╡ 1010bc25-98a7-4836-a821-cb554bb38c34
begin
Y = periodogram(df.P3; fs=500)
plot(Y.freq, 2 * DSP.pow2db.(Y.power), legend=false)
end

# ╔═╡ 921db00e-2942-4132-bd37-bc37f3023f9b
# ╠═╡ disabled = true
#=╠═╡
begin
Y = periodogram(df.Fp1; fs=500)
plot(Y.freq, 2 * DSP.pow2db.(Y.power), legend=false)
end
  ╠═╡ =#

# ╔═╡ Cell order:
# ╠═70f3e92c-2339-42ea-9c73-9ab07730f569
# ╠═3c22c13d-437b-42f1-8532-c9888cb3f0ff
# ╠═5fee6ea7-34b9-4144-a998-0079b385856f
# ╠═b7d81afb-dfb3-42e1-96e9-f92fcf7f0cd1
# ╠═1b347b1e-39da-4038-b6c6-461e6163007c
# ╠═921db00e-2942-4132-bd37-bc37f3023f9b
# ╠═1010bc25-98a7-4836-a821-cb554bb38c34
