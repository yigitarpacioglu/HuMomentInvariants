function out = HUinvariant(img)

img = double(img);
out = HUphi(HUeta(HUcomputemoments(img)));

end