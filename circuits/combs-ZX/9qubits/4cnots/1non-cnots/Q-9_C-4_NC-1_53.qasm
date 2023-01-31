OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[4];
cx q[7], q[5];
cx q[1], q[7];
cx q[1], q[0];
cx q[8], q[6];
