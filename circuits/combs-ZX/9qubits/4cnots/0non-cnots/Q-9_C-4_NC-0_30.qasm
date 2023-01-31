OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[0], q[6];
cx q[1], q[0];
cx q[5], q[4];
