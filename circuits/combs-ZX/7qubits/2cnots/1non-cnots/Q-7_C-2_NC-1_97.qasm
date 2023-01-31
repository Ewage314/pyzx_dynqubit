OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[5], q[3];
z q[3];
cx q[5], q[4];
