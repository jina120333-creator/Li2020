/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  v2312                                 |
|   \\  /    A nd           | Website:  www.openfoam.com                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/
FoamFile
{
    version     2.0;
    format      ascii;
    class       volScalarField;
    object      epsilon;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

dimensions      [0 2 -3 0 0 0 0];

internalField   uniform 10e-5; //2.09e-3;  //4.39e-03;

boundaryField
{
    inletWater
    {
        type            fixedValue;
        value           $internalField;
    }
    inletSediment
    {
        type            fixedValue;
        value           $internalField;
        //type            zeroGradient;
    }

    outletWater
    {
        type            inletOutlet;
        inletValue      $internalField;
        value           $internalField;
    }
    outletSediment
    {
        type            inletOutlet;
        inletValue      $internalField;
        value           $internalField;
    }
    top
    {
        type            symmetryPlane;
        //type            zeroGradient;
        /*
        type            inletOutlet;
        inletValue      $internalField;
        value           $internalField;
        */
    }
    "(sideWalls|bottom|pier)"
    {
        type            epsilonWallFunction;
        value           $internalField;
    }
    // Binomial blending between the viscous and log-layer epsilon values
    // keeps the wall function well-behaved in the buffer layer (pier
    // y+ ~ 10-30); exact patch name beats the regex above.
    pier
    {
        type            epsilonWallFunction;
        blending        binomial;
        value           $internalField;
    }

}


// ************************************************************************* //
