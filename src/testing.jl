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

# ╔═╡ b7d81afb-dfb3-42e1-96e9-f92fcf7f0cd1
begin
	# there don't seem to be anomalous data points! So normalise as per usual
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

# ╔═╡ 1b347b1e-39da-4038-b6c6-461e6163007c
begin
	for i in names(df)
		normalise_channel(df[!, i])
	end
end

# ╔═╡ 921db00e-2942-4132-bd37-bc37f3023f9b


# ╔═╡ Cell order:
# ╠═70f3e92c-2339-42ea-9c73-9ab07730f569
# ╠═3c22c13d-437b-42f1-8532-c9888cb3f0ff
# ╠═5fee6ea7-34b9-4144-a998-0079b385856f
# ╠═a255a0c1-31cf-446f-82ea-827326805b1b
# ╠═b7d81afb-dfb3-42e1-96e9-f92fcf7f0cd1
# ╠═1b347b1e-39da-4038-b6c6-461e6163007c
# ╠═921db00e-2942-4132-bd37-bc37f3023f9b
