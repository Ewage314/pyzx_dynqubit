OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[0];
cx q[6], q[7];
z q[2];
cx q[10], q[0];
cx q[5], q[1];
