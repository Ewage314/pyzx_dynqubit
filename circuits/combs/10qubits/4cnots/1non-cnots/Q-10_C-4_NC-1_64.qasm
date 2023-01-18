OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[0];
cx q[9], q[5];
cx q[3], q[5];
cx q[6], q[1];
cx q[3], q[7];
