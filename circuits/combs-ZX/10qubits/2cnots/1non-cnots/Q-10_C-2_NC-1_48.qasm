OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[7];
z q[0];
cx q[6], q[5];
