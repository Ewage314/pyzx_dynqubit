OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[2];
cx q[8], q[0];
cx q[3], q[7];
cx q[4], q[0];
cx q[1], q[6];
