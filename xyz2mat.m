function [segmentP1, segmentP2, segmentP3, segmentP4] = xyz2mat (segmentX, segmentY, segmentZ)
%function puts the cell arrays into more managable mat format wth xyz column
%vectors

segmentP1xyz = [segmentX(:,1),segmentY(:,1),segmentZ(:,1)];
segmentP1 = cell2mat(segmentP1xyz);
segmentP2xyz = [segmentX(:,2),segmentY(:,2),segmentZ(:,2)];
segmentP2 = cell2mat(segmentP2xyz);
segmentP3xyz = [segmentX(:,3),segmentY(:,3),segmentZ(:,3)];
segmentP3 = cell2mat(segmentP3xyz);
segmentP4xyz = [segmentX(:,4),segmentY(:,4),segmentZ(:,4)];
segmentP4 = cell2mat(segmentP4xyz);
end

%example
%{
trunkP1xyz = [TrunkX(:,1),TrunkY(:,1),TrunkZ(:,1)];
trunkP1 = cell2mat(trunkP1xyz);
trunkP2xyz = [TrunkX(:,2),TrunkY(:,2),TrunkZ(:,2)];
trunkP2 = cell2mat(trunkP2xyz);
trunkP3xyz = [TrunkX(:,3),TrunkY(:,3),TrunkZ(:,3)];
trunkP3 = cell2mat(trunkP3xyz);
%}