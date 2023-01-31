OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[0];
z q[6];
z q[5];
cx q[3], q[1];
