/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  5                                     |
|   \\  /    A nd           | Web:      www.OpenFOAM.org                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/
FoamFile
{
    version     2.0;
    format      ascii;
    class       volScalarField;
    location    "0";
    object      nut;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

dimensions      [0 2 -1 0 0 0 0];

internalField   uniform 0;

boundaryField
{
    "(sideWalls|bottom|pier)"
    {
        type            nutkRoughWallFunction;
    	Ks		        uniform 0;
        Cs	            uniform 0.5;
        value           uniform 0;
    }
    // Exact patch name beats the regex above. The pier wall cells sit at
    // y+ ~ 10-30 (buffer layer), where the log-law based nutk function is
    // invalid. Spalding's law is continuous over 0 < y+ < 300, so it stays
    // accurate without refining the pier mesh.
    pier
    {
        type            nutUSpaldingWallFunction;
        value           uniform 0;
    }
    top
    {
        type            symmetryPlane;
        //type    calculated;
        //value   uniform 0;
    }
    inletWater
    {
	       type calculated;
    	   value uniform 0;
    }
    inletSediment
    {
	       type calculated;
    	   value uniform 0;
    }
    outletWater
    {
	    type calculated;
    	value uniform 0;
    }
    outletSediment
    {
    	type calculated;
    	value uniform 0;
    }

}


// ************************************************************************* //
