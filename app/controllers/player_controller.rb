class PlayerController < ApplicationController
    def new
		$player1=Player.new
		$player2=Player.new
		
	end
	def create
	@player1count=0
	@player2count=0
	rating1 = params[:player][:rating1]
	rating2 = params[:player][:rating1]
	volatility1 = params[:player][:volatility1]
	volatility2 = params[:player][:volatility2]
	#$player1=Player.new
	$player1.rating=rating1
	$player1.volatility=volatility1
	validate_player1=$player1.save
	#$player2=Player.new
	$player2.rating=rating2
	$player2.volatility=volatility2
	validate_player2=$player2.save
	if validate_player1==false || validate_player2==false
	render 'new'
	end
	rating1 = rating1.to_i
	rating2 = rating1.to_i
	volatility1 = volatility1.to_i
	volatility2 = volatility2.to_i
	10000.times do
	x = gaussian(rating1, volatility1)
	y = gaussian(rating2, volatility2)
	if x > y
	@player1count=@player1count+1
	else
	@player2count=@player2count+1
	end
	end
	@player1count=@player1count/100
	@player2count=@player2count/100
	
	end
	def gaussian(mean, stddev)
		rng = lambda { Kernel.rand }
		theta = 2 * Math::PI * rng.call
		rho = Math.sqrt(-2 * Math.log(1 - rng.call))
		scale = rho * stddev
		x = mean + scale * Math.cos(theta)
		y = mean + scale * Math.sin(theta)
		return (x + y) / 2
	end
	
end
