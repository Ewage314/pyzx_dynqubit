OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[7], q[4];
z q[7];
cx q[7], q[2];
