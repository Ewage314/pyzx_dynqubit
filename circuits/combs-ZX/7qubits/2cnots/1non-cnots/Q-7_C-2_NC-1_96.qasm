OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[0];
cx q[1], q[0];
cx q[5], q[4];
