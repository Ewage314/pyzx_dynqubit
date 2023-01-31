OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[0];
z q[2];
cx q[3], q[5];
cx q[5], q[4];
