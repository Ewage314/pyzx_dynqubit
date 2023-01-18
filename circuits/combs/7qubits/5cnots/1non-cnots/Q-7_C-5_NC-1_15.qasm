OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[2];
cx q[2], q[3];
cx q[6], q[5];
cx q[3], q[5];
cx q[3], q[0];
cx q[2], q[6];
