OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[3], q[2];
z q[6];
cx q[0], q[3];
