OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[1], q[3];
z q[6];
cx q[5], q[1];
