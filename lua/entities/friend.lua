AddCSLuaFile()

ENT.PrintName = "frend"
ENT.Base 			= "base_nextbot"

function ENT:Initialize()


	self:SetModel( "models/player/kleiner.mdl" )
	
	self.LoseTargetDist	= 2000	-- How far the enemy has to be before we lose them
	self.SearchRadius 	= 1000	-- How far to search for enemies
	
end

function ENT:RunBehaviour()

	while ( true ) do							-- Here is the loop, it will run forever

		--self:StartActivity( ACT_WALK )			-- Walk animation
		self.loco:SetDesiredSpeed( 200 )		-- Walk speed
		self:MoveToPos( self:GetPos() + Vector( math.Rand( -1, 1 ), math.Rand( -1, 1 ), 0 ) * 300 ) -- Walk to a random place within about 300 units (yielding)
		--self:StartActivity( ACT_IDLE )			-- Idle animation
		coroutine.wait(2)						-- Pause for 2 seconds

		coroutine.yield()
		-- The function is done here, but will start back at the top of the loop and make the bot walk somewhere else
	end

end