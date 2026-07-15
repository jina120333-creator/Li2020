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
    object      k;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

dimensions      [0 2 -2 0 0 0 0];

internalField   uniform 8.5e-4; //0;  //4.14e-03; //$turbulentKE;

boundaryField
{
    inletWater
    {
        type            fixedValue;
        value           uniform 8.5e-4; 
        //value           $internalField;
    }
    inletSediment
    {
        type            fixedValue;
        value           uniform 8.5e-4; 
        //value           $internalField;
        //type            zeroGradient;
    }
    outletWater
    {
        type            zeroGradient;
        //type            inletOutlet;
        //inletValue      $internalField;
        //value           $internalField;
    }
    outletSediment
    {
        type            zeroGradient;
        //type            inletOutlet;
        //inletValue      $internalField;
        //value           $internalField;
    }
    top
    {
        type            zeroGradient;
        //type            symmetryPlane;
        /*
        type            inletOutlet;
        inletValue      $internalField;
        value           $internalField;
        */
    }
    "(sideWalls|bottom|pier)"
    {
        type            kqRWallFunction;
        value           $internalField;
    }

}

// ************************************************************************* //
