OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[9];
z q[1];
cx q[5], q[3];
cx q[6], q[7];
cx q[5], q[2];
