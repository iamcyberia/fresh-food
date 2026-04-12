global.inspectionSpin = 0.0;

if (
    string.find(I:getActualName(context.item), "Plate") or
    string.find(I:getActualName(context.item), "Plated") 
) then
    M:rotateY(context.matrices, 4 * M:sin(Easings:easeInOutBack(inspectionSpin) * 6.28))
end