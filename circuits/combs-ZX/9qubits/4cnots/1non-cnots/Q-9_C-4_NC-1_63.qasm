OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[7];
cx q[8], q[2];
cx q[5], q[2];
cx q[8], q[1];
cx q[5], q[6];
