OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[4];
cx q[7], q[13];
cx q[11], q[7];
cx q[4], q[3];
